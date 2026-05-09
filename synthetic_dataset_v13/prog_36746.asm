; DESCRIPTION: Creates a magenta rectangular region at (19, 18) spanning 67 by 53 pixels.
; PLAN: r0=19(x), r1=18(y), r2=67(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 18
LDI r2, 67
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
