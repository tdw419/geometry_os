; DESCRIPTION: Renders a black box of size 73x118 starting at (63, 52).
; PLAN: r0=63(x), r1=52(y), r2=73(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 52
LDI r2, 73
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
