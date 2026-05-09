; DESCRIPTION: Renders a black box of size 114x51 starting at (351, 6).
; PLAN: r0=351(x), r1=6(y), r2=114(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 6
LDI r2, 114
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
