; DESCRIPTION: Creates a magenta rectangular region at (85, 67) spanning 18 by 114 pixels.
; PLAN: r0=85(x), r1=67(y), r2=18(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 67
LDI r2, 18
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
