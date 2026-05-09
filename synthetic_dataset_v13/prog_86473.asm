; DESCRIPTION: Creates a magenta rectangular region at (189, 26) spanning 62 by 88 pixels.
; PLAN: r0=189(x), r1=26(y), r2=62(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 26
LDI r2, 62
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
