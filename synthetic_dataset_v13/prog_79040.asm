; DESCRIPTION: Composite: Places a cyan dot at position (65, 87) then Creates a orange rectangular region at (396, 76) spanning 30 by 118 pixels then Draws a magenta line from (26, 240) to (145, 122).
; PLAN: r0=65(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=76(y), r7=30(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=26(x1), r11=240(y1), r12=145(x2), r13=122(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 87
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 76
LDI r7, 30
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 240
LDI r12, 145
LDI r13, 122
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
