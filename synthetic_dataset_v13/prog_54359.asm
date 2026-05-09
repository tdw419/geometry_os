; DESCRIPTION: Composite: Creates a orange rectangular region at (203, 179) spanning 101 by 33 pixels then Places a purple line segment connecting (427, 158) to (286, 228).
; PLAN: r0=203(x), r1=179(y), r2=101(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x1), r6=158(y1), r7=286(x2), r8=228(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 179
LDI r2, 101
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 158
LDI r7, 286
LDI r8, 228
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
