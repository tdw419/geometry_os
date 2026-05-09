; DESCRIPTION: Creates a black rectangular region at (285, 102) spanning 84 by 76 pixels.
; PLAN: r0=285(x), r1=102(y), r2=84(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 102
LDI r2, 84
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
