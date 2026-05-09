; DESCRIPTION: Composite: Creates a purple rectangular region at (106, 30) spanning 53 by 83 pixels then Draws a orange line from (94, 134) to (218, 222).
; PLAN: r0=106(x), r1=30(y), r2=53(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x1), r6=134(y1), r7=218(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 30
LDI r2, 53
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 134
LDI r7, 218
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
