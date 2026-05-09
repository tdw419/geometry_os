; DESCRIPTION: Creates a magenta rectangular region at (216, 170) spanning 47 by 39 pixels.
; PLAN: r0=216(x), r1=170(y), r2=47(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 170
LDI r2, 47
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
