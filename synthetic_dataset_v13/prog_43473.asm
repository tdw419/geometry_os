; DESCRIPTION: Creates a purple rectangular region at (24, 9) spanning 88 by 11 pixels.
; PLAN: r0=24(x), r1=9(y), r2=88(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 9
LDI r2, 88
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
