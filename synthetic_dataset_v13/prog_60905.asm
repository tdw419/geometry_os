; DESCRIPTION: Renders a black box of size 115x118 starting at (53, 124).
; PLAN: r0=53(x), r1=124(y), r2=115(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 124
LDI r2, 115
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
