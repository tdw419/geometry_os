; DESCRIPTION: Composite: Creates a magenta rectangular region at (155, 100) spanning 88 by 81 pixels then Draws a black line from (287, 191) to (459, 248).
; PLAN: r0=155(x), r1=100(y), r2=88(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x1), r6=191(y1), r7=459(x2), r8=248(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 100
LDI r2, 88
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 191
LDI r7, 459
LDI r8, 248
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
