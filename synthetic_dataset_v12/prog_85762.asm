; DESCRIPTION: Composite: Places a black circle of radius 59 at center (390, 138) then Renders a magenta line between points (235, 157) and (121, 34).
; PLAN: r0=390(x), r1=138(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=157(y1), r7=121(x2), r8=34(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 138
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 157
LDI r7, 121
LDI r8, 34
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
