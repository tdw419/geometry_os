; DESCRIPTION: Creates a magenta rectangular region at (364, 156) spanning 110 by 96 pixels.
; PLAN: r0=364(x), r1=156(y), r2=110(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 156
LDI r2, 110
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
