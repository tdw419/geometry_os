; DESCRIPTION: Renders a black box of size 66x17 starting at (310, 8).
; PLAN: r0=310(x), r1=8(y), r2=66(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 8
LDI r2, 66
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
