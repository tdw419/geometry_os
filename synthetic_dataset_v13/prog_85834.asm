; DESCRIPTION: Composite: Renders a blue line between points (151, 121) and (235, 54) then Places a green dot at position (417, 194).
; PLAN: r0=151(x1), r1=121(y1), r2=235(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=194(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 151
LDI r1, 121
LDI r2, 235
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 194
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
