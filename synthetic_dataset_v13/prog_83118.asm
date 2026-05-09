; DESCRIPTION: Draws a blue rectangle at (255, 30) with width 44 and height 84.
; PLAN: r0=255(x), r1=30(y), r2=44(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 30
LDI r2, 44
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
