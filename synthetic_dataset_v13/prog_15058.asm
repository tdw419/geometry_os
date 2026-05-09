; DESCRIPTION: Renders a yellow box of size 26x43 starting at (144, 88).
; PLAN: r0=144(x), r1=88(y), r2=26(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 88
LDI r2, 26
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
