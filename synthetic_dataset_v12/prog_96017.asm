; DESCRIPTION: Creates a magenta rectangular region at (310, 92) spanning 77 by 67 pixels.
; PLAN: r0=310(x), r1=92(y), r2=77(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 92
LDI r2, 77
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
