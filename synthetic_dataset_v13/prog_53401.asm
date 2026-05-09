; DESCRIPTION: Composite: Places a orange dot at position (110, 216) then Creates a orange rectangular region at (42, 118) spanning 61 by 54 pixels then Places a blue line segment connecting (431, 181) to (5, 206).
; PLAN: r0=110(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=118(y), r7=61(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x1), r11=181(y1), r12=5(x2), r13=206(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 42
LDI r6, 118
LDI r7, 61
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 181
LDI r12, 5
LDI r13, 206
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
