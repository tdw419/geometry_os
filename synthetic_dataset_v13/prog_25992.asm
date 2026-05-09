; DESCRIPTION: Creates a magenta rectangular region at (253, 55) spanning 67 by 76 pixels.
; PLAN: r0=253(x), r1=55(y), r2=67(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 55
LDI r2, 67
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
