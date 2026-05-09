; DESCRIPTION: Composite: Places a blue circle of radius 10 at center (347, 172) then Creates a blue rectangular region at (400, 19) spanning 100 by 51 pixels then Draws a black line from (221, 144) to (71, 164).
; PLAN: r0=347(x), r1=172(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=19(y), r7=100(width), r8=51(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x1), r11=144(y1), r12=71(x2), r13=164(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 172
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 19
LDI r7, 100
LDI r8, 51
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 144
LDI r12, 71
LDI r13, 164
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
