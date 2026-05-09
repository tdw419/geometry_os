; DESCRIPTION: Creates a black rectangular region at (62, 116) spanning 96 by 108 pixels.
; PLAN: r0=62(x), r1=116(y), r2=96(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 116
LDI r2, 96
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
