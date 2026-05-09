; DESCRIPTION: Creates a black rectangular region at (397, 126) spanning 53 by 57 pixels.
; PLAN: r0=397(x), r1=126(y), r2=53(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 126
LDI r2, 53
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
