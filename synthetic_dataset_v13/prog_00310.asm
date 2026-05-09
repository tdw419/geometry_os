; DESCRIPTION: Creates a black rectangular region at (76, 157) spanning 62 by 37 pixels.
; PLAN: r0=76(x), r1=157(y), r2=62(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 157
LDI r2, 62
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
