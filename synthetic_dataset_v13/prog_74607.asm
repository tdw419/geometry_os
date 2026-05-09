; DESCRIPTION: Renders a black box of size 17x36 starting at (132, 137).
; PLAN: r0=132(x), r1=137(y), r2=17(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 137
LDI r2, 17
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
