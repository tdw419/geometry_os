; DESCRIPTION: Composite: Draws a yellow rectangle at (29, 191) with width 59 and height 38 then Draws a orange line from (395, 128) to (258, 235) then Creates a orange circular shape at (67, 74) with radius 54.
; PLAN: r0=29(x), r1=191(y), r2=59(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x1), r6=128(y1), r7=258(x2), r8=235(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=74(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 29
LDI r1, 191
LDI r2, 59
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 128
LDI r7, 258
LDI r8, 235
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 74
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
