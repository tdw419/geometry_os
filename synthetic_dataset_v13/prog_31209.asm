; DESCRIPTION: Creates a magenta rectangular region at (264, 73) spanning 67 by 72 pixels.
; PLAN: r0=264(x), r1=73(y), r2=67(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 73
LDI r2, 67
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
