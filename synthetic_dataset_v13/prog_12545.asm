; DESCRIPTION: Composite: Draws a orange line from (337, 218) to (107, 183) then Creates a blue rectangular region at (266, 38) spanning 89 by 22 pixels.
; PLAN: r0=337(x1), r1=218(y1), r2=107(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=38(y), r7=89(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 218
LDI r2, 107
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 38
LDI r7, 89
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
