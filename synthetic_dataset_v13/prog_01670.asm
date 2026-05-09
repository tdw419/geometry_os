; DESCRIPTION: Creates a magenta rectangular region at (292, 33) spanning 112 by 88 pixels.
; PLAN: r0=292(x), r1=33(y), r2=112(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 33
LDI r2, 112
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
