; DESCRIPTION: Renders a blue box of size 18x119 starting at (175, 136).
; PLAN: r0=175(x), r1=136(y), r2=18(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 136
LDI r2, 18
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
