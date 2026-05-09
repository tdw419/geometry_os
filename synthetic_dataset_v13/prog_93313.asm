; DESCRIPTION: Renders a black box of size 62x78 starting at (253, 11).
; PLAN: r0=253(x), r1=11(y), r2=62(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 11
LDI r2, 62
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
