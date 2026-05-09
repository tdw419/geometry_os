; DESCRIPTION: Creates a black rectangular region at (432, 184) spanning 31 by 66 pixels.
; PLAN: r0=432(x), r1=184(y), r2=31(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 184
LDI r2, 31
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
