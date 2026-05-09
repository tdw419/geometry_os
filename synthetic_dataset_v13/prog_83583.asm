; DESCRIPTION: Creates a magenta rectangular region at (35, 12) spanning 88 by 60 pixels.
; PLAN: r0=35(x), r1=12(y), r2=88(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 12
LDI r2, 88
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
