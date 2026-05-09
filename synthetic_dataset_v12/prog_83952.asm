; DESCRIPTION: Creates a magenta rectangular region at (310, 75) spanning 69 by 101 pixels.
; PLAN: r0=310(x), r1=75(y), r2=69(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 75
LDI r2, 69
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
