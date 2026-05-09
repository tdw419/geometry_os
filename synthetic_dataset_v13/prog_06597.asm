; DESCRIPTION: Renders a black box of size 101x98 starting at (19, 78).
; PLAN: r0=19(x), r1=78(y), r2=101(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 78
LDI r2, 101
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
