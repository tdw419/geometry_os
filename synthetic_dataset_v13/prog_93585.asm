; DESCRIPTION: Creates a black rectangular region at (289, 52) spanning 11 by 105 pixels.
; PLAN: r0=289(x), r1=52(y), r2=11(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 52
LDI r2, 11
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
