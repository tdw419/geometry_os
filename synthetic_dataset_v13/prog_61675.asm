; DESCRIPTION: Composite: Creates a orange circular shape at (132, 122) with radius 24 then Draws a magenta line from (111, 180) to (109, 85) then Creates a green rectangular region at (273, 63) spanning 44 by 114 pixels.
; PLAN: r0=132(x), r1=122(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x1), r6=180(y1), r7=109(x2), r8=85(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=63(y), r12=44(width), r13=114(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 122
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 180
LDI r7, 109
LDI r8, 85
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 63
LDI r12, 44
LDI r13, 114
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
