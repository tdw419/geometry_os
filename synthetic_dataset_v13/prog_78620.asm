; DESCRIPTION: Draws a green rectangle at (282, 140) with width 113 and height 107.
; PLAN: r0=282(x), r1=140(y), r2=113(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 140
LDI r2, 113
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
