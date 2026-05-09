; DESCRIPTION: Composite: Creates a red rectangular region at (119, 79) spanning 119 by 62 pixels then Draws a purple line from (371, 61) to (430, 234).
; PLAN: r0=119(x), r1=79(y), r2=119(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=61(y1), r7=430(x2), r8=234(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 79
LDI r2, 119
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 61
LDI r7, 430
LDI r8, 234
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
