; DESCRIPTION: Draws a green rectangle at (348, 61) with width 85 and height 54.
; PLAN: r0=348(x), r1=61(y), r2=85(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 61
LDI r2, 85
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
