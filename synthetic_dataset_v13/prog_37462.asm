; DESCRIPTION: Creates a black rectangular region at (134, 65) spanning 62 by 73 pixels.
; PLAN: r0=134(x), r1=65(y), r2=62(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 65
LDI r2, 62
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
