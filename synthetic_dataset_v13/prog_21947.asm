; DESCRIPTION: Renders a black box of size 105x118 starting at (167, 55).
; PLAN: r0=167(x), r1=55(y), r2=105(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 55
LDI r2, 105
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
