; DESCRIPTION: Creates a magenta rectangular region at (2, 33) spanning 88 by 89 pixels.
; PLAN: r0=2(x), r1=33(y), r2=88(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 33
LDI r2, 88
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
