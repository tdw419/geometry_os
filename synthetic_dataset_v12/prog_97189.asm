; DESCRIPTION: Creates a black rectangular region at (329, 153) spanning 117 by 76 pixels.
; PLAN: r0=329(x), r1=153(y), r2=117(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 153
LDI r2, 117
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
