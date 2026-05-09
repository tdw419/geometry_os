; DESCRIPTION: Creates a magenta rectangular region at (205, 170) spanning 118 by 86 pixels.
; PLAN: r0=205(x), r1=170(y), r2=118(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 170
LDI r2, 118
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
