; DESCRIPTION: Renders a black box of size 62x14 starting at (204, 97).
; PLAN: r0=204(x), r1=97(y), r2=62(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 97
LDI r2, 62
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
