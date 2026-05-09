; DESCRIPTION: Draws a blue rectangle at (348, 37) with width 49 and height 20.
; PLAN: r0=348(x), r1=37(y), r2=49(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 37
LDI r2, 49
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
