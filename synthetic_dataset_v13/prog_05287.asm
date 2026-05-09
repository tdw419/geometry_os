; DESCRIPTION: Composite: Draws a black rectangle at (185, 153) with width 104 and height 96 then Renders a orange disk with center (448, 52) and radius 40 then Draws a white line from (454, 56) to (190, 169).
; PLAN: r0=185(x), r1=153(y), r2=104(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=52(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=454(x1), r11=56(y1), r12=190(x2), r13=169(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 153
LDI r2, 104
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 52
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 454
LDI r11, 56
LDI r12, 190
LDI r13, 169
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
