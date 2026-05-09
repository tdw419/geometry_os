; DESCRIPTION: Creates a black rectangular region at (271, 157) spanning 119 by 53 pixels.
; PLAN: r0=271(x), r1=157(y), r2=119(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 157
LDI r2, 119
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
