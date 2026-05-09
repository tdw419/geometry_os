; DESCRIPTION: Draws a green rectangle at (101, 130) with width 51 and height 49.
; PLAN: r0=101(x), r1=130(y), r2=51(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 130
LDI r2, 51
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
