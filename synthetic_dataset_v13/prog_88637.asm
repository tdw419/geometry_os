; DESCRIPTION: Creates a magenta rectangular region at (89, 183) spanning 95 by 30 pixels.
; PLAN: r0=89(x), r1=183(y), r2=95(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 183
LDI r2, 95
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
