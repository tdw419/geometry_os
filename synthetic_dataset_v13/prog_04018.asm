; DESCRIPTION: Creates a black rectangular region at (72, 34) spanning 83 by 89 pixels.
; PLAN: r0=72(x), r1=34(y), r2=83(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 34
LDI r2, 83
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
