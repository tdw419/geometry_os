; DESCRIPTION: Renders a black box of size 74x17 starting at (138, 238).
; PLAN: r0=138(x), r1=238(y), r2=74(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 238
LDI r2, 74
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
