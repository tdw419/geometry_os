; DESCRIPTION: Creates a black rectangular region at (338, 83) spanning 49 by 89 pixels.
; PLAN: r0=338(x), r1=83(y), r2=49(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 83
LDI r2, 49
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
