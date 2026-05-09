; DESCRIPTION: Creates a black rectangular region at (100, 114) spanning 31 by 51 pixels.
; PLAN: r0=100(x), r1=114(y), r2=31(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 114
LDI r2, 31
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
