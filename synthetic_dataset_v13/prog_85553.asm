; DESCRIPTION: Creates a magenta rectangular region at (216, 123) spanning 75 by 112 pixels.
; PLAN: r0=216(x), r1=123(y), r2=75(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 123
LDI r2, 75
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
