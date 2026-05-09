; DESCRIPTION: Creates a magenta rectangular region at (282, 43) spanning 88 by 119 pixels.
; PLAN: r0=282(x), r1=43(y), r2=88(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 43
LDI r2, 88
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
