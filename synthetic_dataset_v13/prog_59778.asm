; DESCRIPTION: Creates a purple rectangular region at (14, 137) spanning 62 by 89 pixels.
; PLAN: r0=14(x), r1=137(y), r2=62(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 137
LDI r2, 62
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
