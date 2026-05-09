; DESCRIPTION: Creates a black rectangular region at (383, 62) spanning 55 by 97 pixels.
; PLAN: r0=383(x), r1=62(y), r2=55(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 62
LDI r2, 55
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
