; DESCRIPTION: Composite: Draws a magenta line from (424, 154) to (165, 30) then Creates a green circular shape at (148, 127) with radius 74 then Creates a blue rectangular region at (179, 125) spanning 63 by 85 pixels.
; PLAN: r0=424(x1), r1=154(y1), r2=165(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=127(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=125(y), r12=63(width), r13=85(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 154
LDI r2, 165
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 127
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 125
LDI r12, 63
LDI r13, 85
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
