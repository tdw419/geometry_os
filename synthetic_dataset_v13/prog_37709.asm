; DESCRIPTION: Creates a black rectangular region at (421, 137) spanning 37 by 100 pixels.
; PLAN: r0=421(x), r1=137(y), r2=37(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 137
LDI r2, 37
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
