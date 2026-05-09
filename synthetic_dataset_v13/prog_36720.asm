; DESCRIPTION: Creates a magenta rectangular region at (183, 140) spanning 88 by 105 pixels.
; PLAN: r0=183(x), r1=140(y), r2=88(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 140
LDI r2, 88
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
