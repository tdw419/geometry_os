; DESCRIPTION: Creates a black rectangular region at (381, 43) spanning 14 by 90 pixels.
; PLAN: r0=381(x), r1=43(y), r2=14(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 43
LDI r2, 14
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
