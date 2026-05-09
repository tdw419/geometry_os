; DESCRIPTION: Creates a black rectangular region at (347, 88) spanning 36 by 108 pixels.
; PLAN: r0=347(x), r1=88(y), r2=36(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 88
LDI r2, 36
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
