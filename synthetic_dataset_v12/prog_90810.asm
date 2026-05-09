; DESCRIPTION: Creates a black rectangular region at (32, 39) spanning 84 by 53 pixels.
; PLAN: r0=32(x), r1=39(y), r2=84(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 39
LDI r2, 84
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
