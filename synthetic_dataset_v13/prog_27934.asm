; DESCRIPTION: Draws a blue rectangle at (151, 132) with width 32 and height 84.
; PLAN: r0=151(x), r1=132(y), r2=32(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 132
LDI r2, 32
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
