; DESCRIPTION: Creates a magenta rectangular region at (484, 103) spanning 11 by 112 pixels.
; PLAN: r0=484(x), r1=103(y), r2=11(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 103
LDI r2, 11
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
