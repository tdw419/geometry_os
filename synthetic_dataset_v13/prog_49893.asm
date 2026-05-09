; DESCRIPTION: Creates a black rectangular region at (118, 62) spanning 13 by 119 pixels.
; PLAN: r0=118(x), r1=62(y), r2=13(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 62
LDI r2, 13
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
