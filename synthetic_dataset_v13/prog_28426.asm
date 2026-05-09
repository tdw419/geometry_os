; DESCRIPTION: Renders a black box of size 43x74 starting at (238, 1).
; PLAN: r0=238(x), r1=1(y), r2=43(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 1
LDI r2, 43
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
