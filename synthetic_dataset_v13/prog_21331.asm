; DESCRIPTION: Composite: Places a purple line segment connecting (30, 78) to (53, 34) then Places a black circle of radius 14 at center (314, 26).
; PLAN: r0=30(x1), r1=78(y1), r2=53(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=26(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 78
LDI r2, 53
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 26
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
