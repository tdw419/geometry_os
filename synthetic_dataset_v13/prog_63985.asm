; DESCRIPTION: Composite: Creates a magenta rectangular region at (81, 3) spanning 87 by 63 pixels then Places a purple line segment connecting (365, 170) to (356, 110).
; PLAN: r0=81(x), r1=3(y), r2=87(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x1), r6=170(y1), r7=356(x2), r8=110(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 3
LDI r2, 87
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 170
LDI r7, 356
LDI r8, 110
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
