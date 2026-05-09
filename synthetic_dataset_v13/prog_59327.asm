; DESCRIPTION: Creates a magenta rectangular region at (425, 148) spanning 67 by 19 pixels.
; PLAN: r0=425(x), r1=148(y), r2=67(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 148
LDI r2, 67
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
