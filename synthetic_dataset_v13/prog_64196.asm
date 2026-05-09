; DESCRIPTION: Creates a black rectangular region at (166, 18) spanning 14 by 53 pixels.
; PLAN: r0=166(x), r1=18(y), r2=14(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 18
LDI r2, 14
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
