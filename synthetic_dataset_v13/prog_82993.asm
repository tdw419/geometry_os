; DESCRIPTION: Creates a magenta rectangular region at (94, 170) spanning 38 by 47 pixels.
; PLAN: r0=94(x), r1=170(y), r2=38(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 170
LDI r2, 38
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
