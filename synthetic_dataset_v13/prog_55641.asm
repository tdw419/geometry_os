; DESCRIPTION: Creates a black rectangular region at (469, 6) spanning 34 by 115 pixels.
; PLAN: r0=469(x), r1=6(y), r2=34(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 6
LDI r2, 34
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
