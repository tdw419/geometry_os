; DESCRIPTION: Renders a black box of size 19x24 starting at (151, 232).
; PLAN: r0=151(x), r1=232(y), r2=19(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 232
LDI r2, 19
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
