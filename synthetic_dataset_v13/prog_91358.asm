; DESCRIPTION: Creates a black rectangular region at (287, 141) spanning 108 by 97 pixels.
; PLAN: r0=287(x), r1=141(y), r2=108(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 141
LDI r2, 108
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
