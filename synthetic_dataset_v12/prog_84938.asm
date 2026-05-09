; DESCRIPTION: Renders a black box of size 96x74 starting at (310, 101).
; PLAN: r0=310(x), r1=101(y), r2=96(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 101
LDI r2, 96
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
