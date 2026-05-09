; DESCRIPTION: Creates a magenta rectangular region at (292, 92) spanning 24 by 100 pixels.
; PLAN: r0=292(x), r1=92(y), r2=24(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 92
LDI r2, 24
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
