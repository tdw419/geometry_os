; DESCRIPTION: Composite: Renders a black box of size 35x88 starting at (246, 23) then Renders a purple line between points (375, 78) and (247, 18) then Creates a red circular shape at (294, 109) with radius 64.
; PLAN: r0=246(x), r1=23(y), r2=35(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=78(y1), r7=247(x2), r8=18(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=109(y), r12=64(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 23
LDI r2, 35
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 78
LDI r7, 247
LDI r8, 18
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 109
LDI r12, 64
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
