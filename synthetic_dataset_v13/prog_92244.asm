; DESCRIPTION: Draws a blue rectangle at (316, 6) with width 31 and height 63.
; PLAN: r0=316(x), r1=6(y), r2=31(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 6
LDI r2, 31
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
