; DESCRIPTION: Creates a purple rectangular region at (97, 162) spanning 40 by 88 pixels.
; PLAN: r0=97(x), r1=162(y), r2=40(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 162
LDI r2, 40
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
