; DESCRIPTION: Draws a green rectangle at (348, 179) with width 27 and height 37.
; PLAN: r0=348(x), r1=179(y), r2=27(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 179
LDI r2, 27
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
