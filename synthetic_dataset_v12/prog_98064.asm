; DESCRIPTION: Creates a purple rectangular region at (219, 49) spanning 52 by 94 pixels.
; PLAN: r0=219(x), r1=49(y), r2=52(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 49
LDI r2, 52
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
