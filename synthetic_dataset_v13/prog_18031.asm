; DESCRIPTION: Creates a black rectangular region at (452, 73) spanning 26 by 116 pixels.
; PLAN: r0=452(x), r1=73(y), r2=26(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 73
LDI r2, 26
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
