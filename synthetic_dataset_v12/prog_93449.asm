; DESCRIPTION: Renders a black box of size 117x118 starting at (341, 121).
; PLAN: r0=341(x), r1=121(y), r2=117(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 121
LDI r2, 117
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
