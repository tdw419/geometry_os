; DESCRIPTION: Renders a black box of size 81x78 starting at (20, 49).
; PLAN: r0=20(x), r1=49(y), r2=81(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 49
LDI r2, 81
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
