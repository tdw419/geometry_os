; DESCRIPTION: Draws a blue rectangle at (284, 159) with width 51 and height 88.
; PLAN: r0=284(x), r1=159(y), r2=51(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 159
LDI r2, 51
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
