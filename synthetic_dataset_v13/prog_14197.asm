; DESCRIPTION: Creates a black rectangular region at (89, 142) spanning 51 by 14 pixels.
; PLAN: r0=89(x), r1=142(y), r2=51(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 142
LDI r2, 51
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
