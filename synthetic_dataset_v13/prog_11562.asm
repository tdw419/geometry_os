; DESCRIPTION: Creates a magenta rectangular region at (339, 102) spanning 12 by 99 pixels.
; PLAN: r0=339(x), r1=102(y), r2=12(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 102
LDI r2, 12
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
