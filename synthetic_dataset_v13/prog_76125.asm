; DESCRIPTION: Draws a purple rectangle at (348, 130) with width 77 and height 16.
; PLAN: r0=348(x), r1=130(y), r2=77(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 130
LDI r2, 77
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
