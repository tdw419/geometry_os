; DESCRIPTION: Creates a magenta rectangular region at (157, 170) spanning 118 by 40 pixels.
; PLAN: r0=157(x), r1=170(y), r2=118(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 170
LDI r2, 118
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
