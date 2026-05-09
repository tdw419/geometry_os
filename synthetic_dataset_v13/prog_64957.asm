; DESCRIPTION: Creates a yellow rectangular region at (469, 43) spanning 34 by 51 pixels.
; PLAN: r0=469(x), r1=43(y), r2=34(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 43
LDI r2, 34
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
