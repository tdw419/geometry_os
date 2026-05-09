; DESCRIPTION: Draws a blue rectangle at (358, 84) with width 64 and height 94.
; PLAN: r0=358(x), r1=84(y), r2=64(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 84
LDI r2, 64
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
