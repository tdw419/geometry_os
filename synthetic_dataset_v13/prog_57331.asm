; DESCRIPTION: Creates a purple rectangular region at (280, 52) spanning 62 by 88 pixels.
; PLAN: r0=280(x), r1=52(y), r2=62(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 52
LDI r2, 62
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
