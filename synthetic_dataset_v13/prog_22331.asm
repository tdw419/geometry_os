; DESCRIPTION: Composite: Creates a blue rectangular region at (486, 95) spanning 10 by 103 pixels then Places a magenta circle of radius 25 at center (312, 229) then Places a black line segment connecting (388, 191) to (13, 67).
; PLAN: r0=486(x), r1=95(y), r2=10(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=229(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x1), r11=191(y1), r12=13(x2), r13=67(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 95
LDI r2, 10
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 229
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 191
LDI r12, 13
LDI r13, 67
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
