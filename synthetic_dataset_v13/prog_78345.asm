; DESCRIPTION: Creates a magenta rectangular region at (183, 184) spanning 21 by 67 pixels.
; PLAN: r0=183(x), r1=184(y), r2=21(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 184
LDI r2, 21
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
