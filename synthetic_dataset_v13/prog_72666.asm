; DESCRIPTION: Composite: Renders a blue line between points (27, 235) and (321, 162) then Draws a magenta circle centered at (222, 165) with radius 23 then Creates a blue rectangular region at (140, 75) spanning 104 by 45 pixels.
; PLAN: r0=27(x1), r1=235(y1), r2=321(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=165(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=75(y), r12=104(width), r13=45(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 27
LDI r1, 235
LDI r2, 321
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 165
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 75
LDI r12, 104
LDI r13, 45
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
