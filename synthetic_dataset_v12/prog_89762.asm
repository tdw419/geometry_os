; DESCRIPTION: Renders a black box of size 18x101 starting at (72, 51).
; PLAN: r0=72(x), r1=51(y), r2=18(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 51
LDI r2, 18
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
