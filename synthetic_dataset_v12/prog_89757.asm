; DESCRIPTION: Creates a black rectangular region at (8, 43) spanning 105 by 19 pixels.
; PLAN: r0=8(x), r1=43(y), r2=105(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 43
LDI r2, 105
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
