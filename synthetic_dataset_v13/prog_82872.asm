; DESCRIPTION: Renders a black box of size 50x51 starting at (181, 118).
; PLAN: r0=181(x), r1=118(y), r2=50(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 118
LDI r2, 50
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
