; DESCRIPTION: Renders a blue box of size 88x43 starting at (272, 74).
; PLAN: r0=272(x), r1=74(y), r2=88(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 74
LDI r2, 88
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
