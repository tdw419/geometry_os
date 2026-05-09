; DESCRIPTION: Renders a blue box of size 43x14 starting at (155, 203).
; PLAN: r0=155(x), r1=203(y), r2=43(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 203
LDI r2, 43
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
