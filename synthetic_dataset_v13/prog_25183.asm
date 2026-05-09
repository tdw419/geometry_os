; DESCRIPTION: Creates a red rectangular region at (451, 137) spanning 15 by 88 pixels.
; PLAN: r0=451(x), r1=137(y), r2=15(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 137
LDI r2, 15
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
