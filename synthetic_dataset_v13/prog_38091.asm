; DESCRIPTION: Renders a yellow box of size 51x118 starting at (368, 53).
; PLAN: r0=368(x), r1=53(y), r2=51(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 53
LDI r2, 51
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
