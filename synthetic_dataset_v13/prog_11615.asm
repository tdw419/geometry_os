; DESCRIPTION: Creates a black rectangular region at (12, 58) spanning 90 by 53 pixels.
; PLAN: r0=12(x), r1=58(y), r2=90(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 58
LDI r2, 90
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
