; DESCRIPTION: Creates a magenta rectangular region at (105, 43) spanning 119 by 30 pixels.
; PLAN: r0=105(x), r1=43(y), r2=119(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 43
LDI r2, 119
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
