; DESCRIPTION: Creates a black rectangular region at (332, 43) spanning 116 by 40 pixels.
; PLAN: r0=332(x), r1=43(y), r2=116(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 43
LDI r2, 116
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
