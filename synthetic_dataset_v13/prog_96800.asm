; DESCRIPTION: Creates a black rectangular region at (87, 2) spanning 100 by 53 pixels.
; PLAN: r0=87(x), r1=2(y), r2=100(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 2
LDI r2, 100
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
