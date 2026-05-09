; DESCRIPTION: Composite: Places a green line segment connecting (262, 72) to (72, 112) then Places a blue circle of radius 68 at center (235, 174) then Creates a orange rectangular region at (155, 69) spanning 14 by 37 pixels.
; PLAN: r0=262(x1), r1=72(y1), r2=72(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=174(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=69(y), r12=14(width), r13=37(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 72
LDI r2, 72
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 174
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 69
LDI r12, 14
LDI r13, 37
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
