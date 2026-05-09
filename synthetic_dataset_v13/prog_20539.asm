; DESCRIPTION: Creates a magenta rectangular region at (119, 170) spanning 106 by 75 pixels.
; PLAN: r0=119(x), r1=170(y), r2=106(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 170
LDI r2, 106
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
