; DESCRIPTION: Creates a magenta rectangular region at (370, 170) spanning 114 by 86 pixels.
; PLAN: r0=370(x), r1=170(y), r2=114(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 170
LDI r2, 114
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
