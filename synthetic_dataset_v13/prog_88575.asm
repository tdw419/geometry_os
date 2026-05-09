; DESCRIPTION: Renders a black box of size 101x108 starting at (292, 118).
; PLAN: r0=292(x), r1=118(y), r2=101(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 118
LDI r2, 101
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
