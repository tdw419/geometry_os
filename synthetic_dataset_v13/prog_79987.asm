; DESCRIPTION: Composite: Places a magenta line segment connecting (210, 178) to (293, 94) then Creates a blue rectangular region at (232, 12) spanning 39 by 106 pixels then Creates a orange circular shape at (79, 93) with radius 36.
; PLAN: r0=210(x1), r1=178(y1), r2=293(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=12(y), r7=39(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=79(x), r11=93(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 210
LDI r1, 178
LDI r2, 293
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 12
LDI r7, 39
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 93
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
