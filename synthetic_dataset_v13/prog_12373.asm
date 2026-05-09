; DESCRIPTION: Draws a blue rectangle at (5, 21) with width 113 and height 89.
; PLAN: r0=5(x), r1=21(y), r2=113(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 21
LDI r2, 113
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
