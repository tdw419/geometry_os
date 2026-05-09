; DESCRIPTION: Draws a blue rectangle at (371, 32) with width 74 and height 98.
; PLAN: r0=371(x), r1=32(y), r2=74(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 32
LDI r2, 74
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
