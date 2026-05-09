; DESCRIPTION: Creates a magenta rectangular region at (26, 77) spanning 101 by 84 pixels.
; PLAN: r0=26(x), r1=77(y), r2=101(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 77
LDI r2, 101
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
