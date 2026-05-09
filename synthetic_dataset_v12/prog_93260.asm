; DESCRIPTION: Creates a magenta rectangular region at (67, 138) spanning 98 by 101 pixels.
; PLAN: r0=67(x), r1=138(y), r2=98(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 138
LDI r2, 98
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
