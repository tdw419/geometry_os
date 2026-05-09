; DESCRIPTION: Creates a black rectangular region at (176, 128) spanning 69 by 62 pixels.
; PLAN: r0=176(x), r1=128(y), r2=69(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 128
LDI r2, 69
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
