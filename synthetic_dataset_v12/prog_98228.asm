; DESCRIPTION: Creates a magenta rectangular region at (316, 14) spanning 115 by 73 pixels.
; PLAN: r0=316(x), r1=14(y), r2=115(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 14
LDI r2, 115
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
