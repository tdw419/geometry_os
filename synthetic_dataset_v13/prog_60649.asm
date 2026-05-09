; DESCRIPTION: Composite: Places a purple line segment connecting (31, 84) to (246, 81) then Creates a black circular shape at (256, 117) with radius 12.
; PLAN: r0=31(x1), r1=84(y1), r2=246(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=117(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 31
LDI r1, 84
LDI r2, 246
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 117
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
