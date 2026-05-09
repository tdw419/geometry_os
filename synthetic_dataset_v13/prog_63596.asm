; DESCRIPTION: Composite: Places a purple line segment connecting (424, 68) to (349, 176) then Sets a single black pixel at (369, 67) then Renders a green box of size 117x36 starting at (375, 181).
; PLAN: r0=424(x1), r1=68(y1), r2=349(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=67(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=375(x), r11=181(y), r12=117(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 68
LDI r2, 349
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 67
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 375
LDI r11, 181
LDI r12, 117
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
