; DESCRIPTION: Creates a magenta rectangular region at (351, 67) spanning 67 by 66 pixels.
; PLAN: r0=351(x), r1=67(y), r2=67(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 67
LDI r2, 67
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
