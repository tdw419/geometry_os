; DESCRIPTION: Creates a black rectangular region at (413, 101) spanning 53 by 29 pixels.
; PLAN: r0=413(x), r1=101(y), r2=53(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 101
LDI r2, 53
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
