; DESCRIPTION: Draws a blue rectangle at (348, 113) with width 91 and height 49.
; PLAN: r0=348(x), r1=113(y), r2=91(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 113
LDI r2, 91
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
