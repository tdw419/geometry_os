; DESCRIPTION: Draws a blue rectangle at (190, 203) with width 103 and height 49.
; PLAN: r0=190(x), r1=203(y), r2=103(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 203
LDI r2, 103
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
