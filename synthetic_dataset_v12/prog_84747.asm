; DESCRIPTION: Composite: Places a blue dot at position (66, 155) then Renders a magenta line between points (129, 157) and (235, 189).
; PLAN: r0=66(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=129(x1), r6=157(y1), r7=235(x2), r8=189(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 157
LDI r7, 235
LDI r8, 189
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
