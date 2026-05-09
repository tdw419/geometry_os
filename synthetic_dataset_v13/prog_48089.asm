; DESCRIPTION: Draws a blue rectangle at (385, 64) with width 116 and height 83.
; PLAN: r0=385(x), r1=64(y), r2=116(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 64
LDI r2, 116
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
