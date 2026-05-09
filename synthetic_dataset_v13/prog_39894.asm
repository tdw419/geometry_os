; DESCRIPTION: Creates a black rectangular region at (12, 198) spanning 97 by 49 pixels.
; PLAN: r0=12(x), r1=198(y), r2=97(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 198
LDI r2, 97
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
