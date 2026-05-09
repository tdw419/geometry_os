; DESCRIPTION: Creates a magenta rectangular region at (30, 73) spanning 72 by 69 pixels.
; PLAN: r0=30(x), r1=73(y), r2=72(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 73
LDI r2, 72
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
