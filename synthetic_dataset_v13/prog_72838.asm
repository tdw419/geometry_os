; DESCRIPTION: Renders a black box of size 107x118 starting at (95, 99).
; PLAN: r0=95(x), r1=99(y), r2=107(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 99
LDI r2, 107
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
