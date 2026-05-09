; DESCRIPTION: Composite: Draws a purple line from (260, 113) to (319, 80) then Creates a black circular shape at (88, 65) with radius 55.
; PLAN: r0=260(x1), r1=113(y1), r2=319(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=65(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 113
LDI r2, 319
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 65
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
