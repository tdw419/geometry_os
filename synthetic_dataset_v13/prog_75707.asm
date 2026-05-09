; DESCRIPTION: Draws a green rectangle at (190, 80) with width 79 and height 67.
; PLAN: r0=190(x), r1=80(y), r2=79(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 80
LDI r2, 79
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
