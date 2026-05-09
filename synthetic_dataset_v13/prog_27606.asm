; DESCRIPTION: Creates a black rectangular region at (396, 95) spanning 114 by 116 pixels.
; PLAN: r0=396(x), r1=95(y), r2=114(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 95
LDI r2, 114
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
