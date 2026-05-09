; DESCRIPTION: Renders a black box of size 118x84 starting at (310, 163).
; PLAN: r0=310(x), r1=163(y), r2=118(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 163
LDI r2, 118
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
