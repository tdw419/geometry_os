; DESCRIPTION: Renders a black box of size 105x114 starting at (234, 119).
; PLAN: r0=234(x), r1=119(y), r2=105(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 119
LDI r2, 105
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
