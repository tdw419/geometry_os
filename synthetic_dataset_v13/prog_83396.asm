; DESCRIPTION: Creates a black rectangular region at (346, 121) spanning 53 by 11 pixels.
; PLAN: r0=346(x), r1=121(y), r2=53(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 121
LDI r2, 53
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
