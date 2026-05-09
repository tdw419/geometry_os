; DESCRIPTION: Renders a black box of size 15x51 starting at (349, 10).
; PLAN: r0=349(x), r1=10(y), r2=15(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 10
LDI r2, 15
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
