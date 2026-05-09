; DESCRIPTION: Draws a blue rectangle at (256, 80) with width 79 and height 114.
; PLAN: r0=256(x), r1=80(y), r2=79(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 80
LDI r2, 79
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
