; DESCRIPTION: Creates a magenta rectangular region at (448, 122) spanning 34 by 114 pixels.
; PLAN: r0=448(x), r1=122(y), r2=34(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 122
LDI r2, 34
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
