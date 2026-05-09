; DESCRIPTION: Creates a black rectangular region at (4, 137) spanning 108 by 35 pixels.
; PLAN: r0=4(x), r1=137(y), r2=108(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 137
LDI r2, 108
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
