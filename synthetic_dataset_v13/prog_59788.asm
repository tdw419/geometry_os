; DESCRIPTION: Draws a green rectangle at (371, 132) with width 87 and height 35.
; PLAN: r0=371(x), r1=132(y), r2=87(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 132
LDI r2, 87
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
