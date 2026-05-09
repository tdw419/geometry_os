; DESCRIPTION: Creates a black rectangular region at (457, 29) spanning 53 by 34 pixels.
; PLAN: r0=457(x), r1=29(y), r2=53(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 29
LDI r2, 53
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
