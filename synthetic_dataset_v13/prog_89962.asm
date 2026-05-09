; DESCRIPTION: Composite: Draws a magenta line from (390, 169) to (462, 74) then Creates a orange rectangular region at (342, 68) spanning 78 by 46 pixels.
; PLAN: r0=390(x1), r1=169(y1), r2=462(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=68(y), r7=78(width), r8=46(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 169
LDI r2, 462
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 68
LDI r7, 78
LDI r8, 46
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
