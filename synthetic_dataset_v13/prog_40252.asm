; DESCRIPTION: Composite: Places a magenta 68x44 rectangle at position (83, 150) then Places a orange circle of radius 20 at center (136, 96) then Places a blue line segment connecting (79, 119) to (229, 214).
; PLAN: r0=83(x), r1=150(y), r2=68(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=96(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x1), r11=119(y1), r12=229(x2), r13=214(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 150
LDI r2, 68
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 96
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 119
LDI r12, 229
LDI r13, 214
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
