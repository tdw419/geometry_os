; DESCRIPTION: Creates a black rectangular region at (77, 17) spanning 95 by 76 pixels.
; PLAN: r0=77(x), r1=17(y), r2=95(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 17
LDI r2, 95
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
