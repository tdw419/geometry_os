; DESCRIPTION: Composite: Draws a black line from (204, 191) to (116, 219) then Renders a blue box of size 17x58 starting at (385, 188).
; PLAN: r0=204(x1), r1=191(y1), r2=116(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=188(y), r7=17(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 191
LDI r2, 116
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 188
LDI r7, 17
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
