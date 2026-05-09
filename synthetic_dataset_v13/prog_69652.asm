; DESCRIPTION: Creates a black rectangular region at (51, 149) spanning 114 by 46 pixels.
; PLAN: r0=51(x), r1=149(y), r2=114(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 149
LDI r2, 114
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
