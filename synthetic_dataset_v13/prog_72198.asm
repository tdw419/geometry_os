; DESCRIPTION: Creates a magenta rectangular region at (270, 2) spanning 88 by 24 pixels.
; PLAN: r0=270(x), r1=2(y), r2=88(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 2
LDI r2, 88
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
