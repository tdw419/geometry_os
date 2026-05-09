; DESCRIPTION: Renders a black box of size 13x51 starting at (114, 99).
; PLAN: r0=114(x), r1=99(y), r2=13(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 99
LDI r2, 13
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
