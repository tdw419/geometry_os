; DESCRIPTION: Composite: Creates a orange rectangular region at (364, 137) spanning 117 by 116 pixels then Renders a purple line between points (268, 63) and (84, 177).
; PLAN: r0=364(x), r1=137(y), r2=117(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x1), r6=63(y1), r7=84(x2), r8=177(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 137
LDI r2, 117
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 63
LDI r7, 84
LDI r8, 177
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
