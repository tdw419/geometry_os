; DESCRIPTION: Composite: Creates a green rectangular region at (79, 94) spanning 11 by 77 pixels then Draws a orange line from (451, 238) to (11, 225).
; PLAN: r0=79(x), r1=94(y), r2=11(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x1), r6=238(y1), r7=11(x2), r8=225(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 94
LDI r2, 11
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 238
LDI r7, 11
LDI r8, 225
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
