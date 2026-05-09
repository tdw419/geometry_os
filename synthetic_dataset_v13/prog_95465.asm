; DESCRIPTION: Composite: Renders a blue line between points (359, 149) and (23, 243) then Creates a green circular shape at (341, 76) with radius 26.
; PLAN: r0=359(x1), r1=149(y1), r2=23(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=76(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 149
LDI r2, 23
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 76
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
