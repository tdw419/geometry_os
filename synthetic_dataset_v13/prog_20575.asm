; DESCRIPTION: Composite: Renders a black box of size 47x120 starting at (67, 123) then Places a blue line segment connecting (206, 11) to (308, 168) then Draws a yellow circle centered at (336, 137) with radius 15.
; PLAN: r0=67(x), r1=123(y), r2=47(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x1), r6=11(y1), r7=308(x2), r8=168(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=137(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 123
LDI r2, 47
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 11
LDI r7, 308
LDI r8, 168
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 137
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
