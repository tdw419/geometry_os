; DESCRIPTION: Draws a blue rectangle at (106, 113) with width 93 and height 10.
; PLAN: r0=106(x), r1=113(y), r2=93(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 113
LDI r2, 93
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
