; DESCRIPTION: Creates a black rectangular region at (234, 83) spanning 97 by 53 pixels.
; PLAN: r0=234(x), r1=83(y), r2=97(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 83
LDI r2, 97
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
