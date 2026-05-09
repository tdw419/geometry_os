; DESCRIPTION: Composite: Draws a cyan rectangle at (221, 88) with width 51 and height 90 then Creates a black circular shape at (152, 141) with radius 79 then Renders a red line between points (397, 100) and (419, 152).
; PLAN: r0=221(x), r1=88(y), r2=51(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=141(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x1), r11=100(y1), r12=419(x2), r13=152(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 221
LDI r1, 88
LDI r2, 51
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 141
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 100
LDI r12, 419
LDI r13, 152
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
