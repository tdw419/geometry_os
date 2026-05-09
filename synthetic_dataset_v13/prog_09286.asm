; DESCRIPTION: Composite: Renders a black box of size 118x23 starting at (360, 78) then Renders a purple disk with center (364, 20) and radius 17.
; PLAN: r0=360(x), r1=78(y), r2=118(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=20(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 78
LDI r2, 118
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 20
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
