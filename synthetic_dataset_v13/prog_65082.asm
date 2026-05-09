; DESCRIPTION: Composite: Draws a blue circle centered at (469, 121) with radius 40 then Places a orange line segment connecting (408, 151) to (103, 67) then Renders a yellow box of size 116x30 starting at (41, 1).
; PLAN: r0=469(x), r1=121(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x1), r6=151(y1), r7=103(x2), r8=67(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=41(x), r11=1(y), r12=116(width), r13=30(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 121
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 151
LDI r7, 103
LDI r8, 67
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 1
LDI r12, 116
LDI r13, 30
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
