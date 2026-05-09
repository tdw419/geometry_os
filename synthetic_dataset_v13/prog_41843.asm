; DESCRIPTION: Creates a purple rectangular region at (97, 43) spanning 88 by 12 pixels.
; PLAN: r0=97(x), r1=43(y), r2=88(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 43
LDI r2, 88
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
