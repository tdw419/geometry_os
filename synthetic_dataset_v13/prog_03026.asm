; DESCRIPTION: Renders a black box of size 119x54 starting at (122, 136).
; PLAN: r0=122(x), r1=136(y), r2=119(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 136
LDI r2, 119
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
