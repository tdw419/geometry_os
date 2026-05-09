; DESCRIPTION: Renders a black box of size 100x93 starting at (102, 43).
; PLAN: r0=102(x), r1=43(y), r2=100(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 43
LDI r2, 100
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
