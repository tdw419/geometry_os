; DESCRIPTION: Composite: Creates a magenta rectangular region at (105, 187) spanning 57 by 19 pixels then Places a orange circle of radius 15 at center (77, 234) then Places a red line segment connecting (219, 94) to (447, 142).
; PLAN: r0=105(x), r1=187(y), r2=57(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=234(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x1), r11=94(y1), r12=447(x2), r13=142(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 187
LDI r2, 57
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 234
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 94
LDI r12, 447
LDI r13, 142
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
