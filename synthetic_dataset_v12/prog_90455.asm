; DESCRIPTION: Creates a purple rectangular region at (219, 218) spanning 24 by 24 pixels.
; PLAN: r0=219(x), r1=218(y), r2=24(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 218
LDI r2, 24
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
