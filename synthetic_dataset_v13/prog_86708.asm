; DESCRIPTION: Creates a black rectangular region at (101, 123) spanning 57 by 83 pixels.
; PLAN: r0=101(x), r1=123(y), r2=57(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 123
LDI r2, 57
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
