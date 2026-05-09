; DESCRIPTION: Creates a black rectangular region at (96, 43) spanning 53 by 55 pixels.
; PLAN: r0=96(x), r1=43(y), r2=53(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 43
LDI r2, 53
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
