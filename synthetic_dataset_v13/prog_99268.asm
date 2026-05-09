; DESCRIPTION: Draws a blue rectangle at (117, 35) with width 113 and height 107.
; PLAN: r0=117(x), r1=35(y), r2=113(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 35
LDI r2, 113
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
