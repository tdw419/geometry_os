; DESCRIPTION: Creates a black rectangular region at (250, 61) spanning 108 by 101 pixels.
; PLAN: r0=250(x), r1=61(y), r2=108(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 61
LDI r2, 108
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
