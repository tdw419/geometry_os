; DESCRIPTION: Composite: Creates a magenta rectangular region at (191, 110) spanning 118 by 65 pixels then Draws a green line from (135, 158) to (54, 67).
; PLAN: r0=191(x), r1=110(y), r2=118(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=135(x1), r6=158(y1), r7=54(x2), r8=67(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 110
LDI r2, 118
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 158
LDI r7, 54
LDI r8, 67
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
