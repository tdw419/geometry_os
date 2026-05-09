; DESCRIPTION: Draws a blue rectangle at (411, 98) with width 35 and height 113.
; PLAN: r0=411(x), r1=98(y), r2=35(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 98
LDI r2, 35
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
