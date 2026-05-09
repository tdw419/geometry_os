; DESCRIPTION: Draws a blue rectangle at (122, 103) with width 119 and height 24.
; PLAN: r0=122(x), r1=103(y), r2=119(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 103
LDI r2, 119
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
