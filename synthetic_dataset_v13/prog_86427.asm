; DESCRIPTION: Draws a blue rectangle at (116, 157) with width 116 and height 81.
; PLAN: r0=116(x), r1=157(y), r2=116(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 157
LDI r2, 116
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
