; DESCRIPTION: Composite: Creates a magenta rectangular region at (394, 224) spanning 105 by 13 pixels then Places a orange line segment connecting (160, 137) to (312, 246).
; PLAN: r0=394(x), r1=224(y), r2=105(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x1), r6=137(y1), r7=312(x2), r8=246(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 224
LDI r2, 105
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 137
LDI r7, 312
LDI r8, 246
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
