; DESCRIPTION: Draws a blue rectangle at (134, 147) with width 25 and height 109.
; PLAN: r0=134(x), r1=147(y), r2=25(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 147
LDI r2, 25
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
