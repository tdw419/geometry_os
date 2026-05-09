; DESCRIPTION: Composite: Places a orange dot at position (291, 145) then Creates a magenta rectangular region at (323, 79) spanning 59 by 79 pixels then Draws a green line from (428, 234) to (508, 136).
; PLAN: r0=291(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=323(x), r6=79(y), r7=59(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x1), r11=234(y1), r12=508(x2), r13=136(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 323
LDI r6, 79
LDI r7, 59
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 234
LDI r12, 508
LDI r13, 136
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
