; DESCRIPTION: Composite: Renders a yellow box of size 52x62 starting at (23, 67) then Draws a white circle centered at (339, 73) with radius 10 then Places a orange line segment connecting (500, 98) to (362, 206).
; PLAN: r0=23(x), r1=67(y), r2=52(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=73(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=98(y1), r12=362(x2), r13=206(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 23
LDI r1, 67
LDI r2, 52
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 73
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 98
LDI r12, 362
LDI r13, 206
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
