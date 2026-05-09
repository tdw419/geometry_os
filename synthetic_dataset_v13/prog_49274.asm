; DESCRIPTION: Creates a black rectangular region at (254, 171) spanning 101 by 76 pixels.
; PLAN: r0=254(x), r1=171(y), r2=101(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 171
LDI r2, 101
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
