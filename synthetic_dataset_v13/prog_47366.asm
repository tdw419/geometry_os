; DESCRIPTION: Draws a purple rectangle at (316, 140) with width 77 and height 48.
; PLAN: r0=316(x), r1=140(y), r2=77(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 140
LDI r2, 77
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
