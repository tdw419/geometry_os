; DESCRIPTION: Creates a magenta rectangular region at (232, 62) spanning 78 by 23 pixels.
; PLAN: r0=232(x), r1=62(y), r2=78(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 62
LDI r2, 78
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
