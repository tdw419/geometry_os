; DESCRIPTION: Composite: Places a purple line segment connecting (192, 139) to (65, 148) then Places a orange dot at position (469, 1) then Renders a blue box of size 14x71 starting at (22, 74).
; PLAN: r0=192(x1), r1=139(y1), r2=65(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=1(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=22(x), r11=74(y), r12=14(width), r13=71(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 139
LDI r2, 65
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 1
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 22
LDI r11, 74
LDI r12, 14
LDI r13, 71
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
