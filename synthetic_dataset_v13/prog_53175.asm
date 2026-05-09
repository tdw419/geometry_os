; DESCRIPTION: Draws a green rectangle at (206, 113) with width 19 and height 118.
; PLAN: r0=206(x), r1=113(y), r2=19(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 113
LDI r2, 19
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
