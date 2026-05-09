; DESCRIPTION: Composite: Creates a orange circular shape at (308, 192) with radius 62 then Draws a black line from (33, 187) to (457, 178) then Renders a black box of size 51x28 starting at (49, 206).
; PLAN: r0=308(x), r1=192(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x1), r6=187(y1), r7=457(x2), r8=178(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=206(y), r12=51(width), r13=28(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 192
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 187
LDI r7, 457
LDI r8, 178
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 206
LDI r12, 51
LDI r13, 28
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
