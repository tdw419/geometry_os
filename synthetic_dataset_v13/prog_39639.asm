; DESCRIPTION: Creates a black rectangular region at (89, 86) spanning 83 by 73 pixels.
; PLAN: r0=89(x), r1=86(y), r2=83(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 86
LDI r2, 83
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
