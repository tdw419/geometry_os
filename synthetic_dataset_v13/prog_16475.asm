; DESCRIPTION: Creates a magenta rectangular region at (366, 92) spanning 67 by 99 pixels.
; PLAN: r0=366(x), r1=92(y), r2=67(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 92
LDI r2, 67
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
