; DESCRIPTION: Creates a black rectangular region at (81, 83) spanning 51 by 119 pixels.
; PLAN: r0=81(x), r1=83(y), r2=51(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 83
LDI r2, 51
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
