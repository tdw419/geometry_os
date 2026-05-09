; DESCRIPTION: Creates a magenta rectangular region at (194, 119) spanning 78 by 103 pixels.
; PLAN: r0=194(x), r1=119(y), r2=78(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 119
LDI r2, 78
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
