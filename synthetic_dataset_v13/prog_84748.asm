; DESCRIPTION: Creates a magenta rectangular region at (114, 61) spanning 15 by 114 pixels.
; PLAN: r0=114(x), r1=61(y), r2=15(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 61
LDI r2, 15
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
