; DESCRIPTION: Creates a black rectangular region at (285, 115) spanning 53 by 78 pixels.
; PLAN: r0=285(x), r1=115(y), r2=53(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 115
LDI r2, 53
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
