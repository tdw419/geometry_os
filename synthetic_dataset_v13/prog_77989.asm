; DESCRIPTION: Creates a magenta rectangular region at (145, 67) spanning 69 by 28 pixels.
; PLAN: r0=145(x), r1=67(y), r2=69(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 67
LDI r2, 69
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
