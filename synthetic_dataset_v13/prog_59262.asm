; DESCRIPTION: Composite: Renders a black line between points (33, 188) and (149, 26) then Draws a green circle centered at (107, 98) with radius 25.
; PLAN: r0=33(x1), r1=188(y1), r2=149(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=98(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 188
LDI r2, 149
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 98
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
