; DESCRIPTION: Creates a magenta rectangular region at (78, 102) spanning 96 by 94 pixels.
; PLAN: r0=78(x), r1=102(y), r2=96(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 102
LDI r2, 96
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
