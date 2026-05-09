; DESCRIPTION: Creates a black rectangular region at (326, 121) spanning 17 by 76 pixels.
; PLAN: r0=326(x), r1=121(y), r2=17(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 121
LDI r2, 17
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
