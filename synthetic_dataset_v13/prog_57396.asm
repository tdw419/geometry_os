; DESCRIPTION: Renders a blue box of size 43x96 starting at (296, 136).
; PLAN: r0=296(x), r1=136(y), r2=43(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 136
LDI r2, 43
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
