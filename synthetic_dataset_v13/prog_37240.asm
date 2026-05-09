; DESCRIPTION: Composite: Creates a purple rectangular region at (348, 203) spanning 26 by 42 pixels then Draws a cyan line from (322, 106) to (276, 212).
; PLAN: r0=348(x), r1=203(y), r2=26(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x1), r6=106(y1), r7=276(x2), r8=212(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 203
LDI r2, 26
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 106
LDI r7, 276
LDI r8, 212
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
