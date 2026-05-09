; DESCRIPTION: Creates a purple rectangular region at (252, 64) spanning 52 by 84 pixels.
; PLAN: r0=252(x), r1=64(y), r2=52(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 64
LDI r2, 52
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
