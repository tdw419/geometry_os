; DESCRIPTION: Composite: Creates a black circular shape at (283, 212) with radius 41 then Places a purple line segment connecting (167, 110) to (341, 185) then Renders a orange box of size 92x49 starting at (141, 145).
; PLAN: r0=283(x), r1=212(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x1), r6=110(y1), r7=341(x2), r8=185(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=145(y), r12=92(width), r13=49(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 212
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 110
LDI r7, 341
LDI r8, 185
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 145
LDI r12, 92
LDI r13, 49
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
