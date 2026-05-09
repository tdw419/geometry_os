; DESCRIPTION: Draws a blue rectangle at (191, 43) with width 12 and height 74.
; PLAN: r0=191(x), r1=43(y), r2=12(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 43
LDI r2, 12
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
