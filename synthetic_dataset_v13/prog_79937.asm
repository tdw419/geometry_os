; DESCRIPTION: Creates a purple rectangular region at (329, 52) spanning 112 by 73 pixels.
; PLAN: r0=329(x), r1=52(y), r2=112(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 52
LDI r2, 112
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
