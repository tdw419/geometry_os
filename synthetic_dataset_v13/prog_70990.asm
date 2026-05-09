; DESCRIPTION: Creates a black rectangular region at (276, 137) spanning 53 by 45 pixels.
; PLAN: r0=276(x), r1=137(y), r2=53(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 137
LDI r2, 53
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
