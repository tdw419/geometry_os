; DESCRIPTION: Draws a blue rectangle at (385, 116) with width 116 and height 74.
; PLAN: r0=385(x), r1=116(y), r2=116(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 116
LDI r2, 116
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
