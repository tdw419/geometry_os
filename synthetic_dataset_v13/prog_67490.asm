; DESCRIPTION: Creates a magenta rectangular region at (427, 73) spanning 52 by 72 pixels.
; PLAN: r0=427(x), r1=73(y), r2=52(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 73
LDI r2, 52
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
