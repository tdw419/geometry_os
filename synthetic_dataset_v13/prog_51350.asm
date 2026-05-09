; DESCRIPTION: Composite: Draws a orange line from (371, 105) to (492, 169) then Creates a magenta rectangular region at (261, 157) spanning 106 by 87 pixels.
; PLAN: r0=371(x1), r1=105(y1), r2=492(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=157(y), r7=106(width), r8=87(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 105
LDI r2, 492
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 157
LDI r7, 106
LDI r8, 87
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
