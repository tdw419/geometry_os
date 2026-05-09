; DESCRIPTION: Renders a black box of size 32x101 starting at (114, 97).
; PLAN: r0=114(x), r1=97(y), r2=32(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 97
LDI r2, 32
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
