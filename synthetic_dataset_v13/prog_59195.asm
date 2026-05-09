; DESCRIPTION: Creates a black rectangular region at (149, 119) spanning 116 by 15 pixels.
; PLAN: r0=149(x), r1=119(y), r2=116(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 119
LDI r2, 116
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
