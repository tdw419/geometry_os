; DESCRIPTION: Renders a black box of size 15x101 starting at (382, 99).
; PLAN: r0=382(x), r1=99(y), r2=15(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 99
LDI r2, 15
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
