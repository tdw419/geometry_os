; DESCRIPTION: Renders a black box of size 30x17 starting at (86, 195).
; PLAN: r0=86(x), r1=195(y), r2=30(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 195
LDI r2, 30
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
