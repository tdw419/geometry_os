; DESCRIPTION: Composite: Renders a blue box of size 33x36 starting at (108, 217) then Draws a purple line from (187, 191) to (504, 249) then Renders a green disk with center (126, 136) and radius 52.
; PLAN: r0=108(x), r1=217(y), r2=33(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x1), r6=191(y1), r7=504(x2), r8=249(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=136(y), r12=52(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 217
LDI r2, 33
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 191
LDI r7, 504
LDI r8, 249
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 136
LDI r12, 52
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
