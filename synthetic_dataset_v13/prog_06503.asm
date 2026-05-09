; DESCRIPTION: Renders a black box of size 13x81 starting at (20, 151).
; PLAN: r0=20(x), r1=151(y), r2=13(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 151
LDI r2, 13
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
