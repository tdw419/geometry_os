; DESCRIPTION: Draws a blue rectangle at (371, 166) with width 83 and height 80.
; PLAN: r0=371(x), r1=166(y), r2=83(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 166
LDI r2, 83
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
