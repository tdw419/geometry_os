; DESCRIPTION: Draws a blue rectangle at (316, 28) with width 112 and height 54.
; PLAN: r0=316(x), r1=28(y), r2=112(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 28
LDI r2, 112
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
