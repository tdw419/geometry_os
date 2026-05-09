; DESCRIPTION: Draws a purple rectangle at (316, 165) with width 109 and height 43.
; PLAN: r0=316(x), r1=165(y), r2=109(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 165
LDI r2, 109
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
