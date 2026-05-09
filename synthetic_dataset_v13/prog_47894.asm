; DESCRIPTION: Creates a black rectangular region at (62, 34) spanning 15 by 62 pixels.
; PLAN: r0=62(x), r1=34(y), r2=15(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 34
LDI r2, 15
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
