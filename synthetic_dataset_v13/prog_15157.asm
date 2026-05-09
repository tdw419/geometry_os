; DESCRIPTION: Composite: Creates a purple rectangular region at (130, 98) spanning 81 by 63 pixels then Places a purple line segment connecting (437, 157) to (181, 252).
; PLAN: r0=130(x), r1=98(y), r2=81(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x1), r6=157(y1), r7=181(x2), r8=252(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 98
LDI r2, 81
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 157
LDI r7, 181
LDI r8, 252
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
