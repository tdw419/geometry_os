; DESCRIPTION: Composite: Places a black line segment connecting (6, 182) to (139, 248) then Creates a blue circular shape at (424, 55) with radius 36 then Draws a purple rectangle at (161, 53) with width 117 and height 102.
; PLAN: r0=6(x1), r1=182(y1), r2=139(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=55(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=53(y), r12=117(width), r13=102(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 182
LDI r2, 139
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 55
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 53
LDI r12, 117
LDI r13, 102
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
