; DESCRIPTION: Creates a purple rectangular region at (381, 214) spanning 62 by 35 pixels.
; PLAN: r0=381(x), r1=214(y), r2=62(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 214
LDI r2, 62
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
