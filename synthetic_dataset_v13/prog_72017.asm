; DESCRIPTION: Draws a blue rectangle at (296, 8) with width 90 and height 107.
; PLAN: r0=296(x), r1=8(y), r2=90(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 8
LDI r2, 90
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
