; DESCRIPTION: Renders a black box of size 23x55 starting at (118, 81).
; PLAN: r0=118(x), r1=81(y), r2=23(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 81
LDI r2, 23
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
