; DESCRIPTION: Creates a black rectangular region at (166, 101) spanning 76 by 105 pixels.
; PLAN: r0=166(x), r1=101(y), r2=76(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 101
LDI r2, 76
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
