; DESCRIPTION: Creates a black rectangular region at (76, 159) spanning 94 by 97 pixels.
; PLAN: r0=76(x), r1=159(y), r2=94(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 159
LDI r2, 94
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
