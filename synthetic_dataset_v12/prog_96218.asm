; DESCRIPTION: Renders a black box of size 10x51 starting at (473, 162).
; PLAN: r0=473(x), r1=162(y), r2=10(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 162
LDI r2, 10
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
