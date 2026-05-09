; DESCRIPTION: Composite: Creates a blue rectangular region at (158, 64) spanning 113 by 110 pixels then Draws a orange line from (106, 176) to (416, 168).
; PLAN: r0=158(x), r1=64(y), r2=113(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=176(y1), r7=416(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 64
LDI r2, 113
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 176
LDI r7, 416
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
