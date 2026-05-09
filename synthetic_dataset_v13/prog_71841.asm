; DESCRIPTION: Renders a black box of size 111x107 starting at (139, 74).
; PLAN: r0=139(x), r1=74(y), r2=111(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 74
LDI r2, 111
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
