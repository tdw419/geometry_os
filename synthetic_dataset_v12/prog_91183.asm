; DESCRIPTION: Creates a magenta rectangular region at (78, 3) spanning 101 by 83 pixels.
; PLAN: r0=78(x), r1=3(y), r2=101(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 3
LDI r2, 101
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
