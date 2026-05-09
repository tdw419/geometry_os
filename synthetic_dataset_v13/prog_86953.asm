; DESCRIPTION: Creates a black rectangular region at (318, 49) spanning 114 by 18 pixels.
; PLAN: r0=318(x), r1=49(y), r2=114(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 49
LDI r2, 114
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
