; DESCRIPTION: Creates a purple rectangular region at (64, 100) spanning 112 by 118 pixels.
; PLAN: r0=64(x), r1=100(y), r2=112(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 100
LDI r2, 112
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
