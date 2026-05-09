; DESCRIPTION: Renders a black box of size 81x107 starting at (377, 139).
; PLAN: r0=377(x), r1=139(y), r2=81(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 139
LDI r2, 81
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
