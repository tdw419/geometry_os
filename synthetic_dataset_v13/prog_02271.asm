; DESCRIPTION: Renders a black box of size 52x107 starting at (377, 118).
; PLAN: r0=377(x), r1=118(y), r2=52(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 118
LDI r2, 52
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
