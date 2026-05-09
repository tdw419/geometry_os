; DESCRIPTION: Creates a magenta rectangular region at (377, 158) spanning 95 by 49 pixels.
; PLAN: r0=377(x), r1=158(y), r2=95(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 158
LDI r2, 95
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
