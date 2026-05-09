; DESCRIPTION: Creates a purple rectangular region at (128, 101) spanning 88 by 14 pixels.
; PLAN: r0=128(x), r1=101(y), r2=88(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 101
LDI r2, 88
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
