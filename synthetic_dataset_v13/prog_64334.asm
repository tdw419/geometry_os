; DESCRIPTION: Draws a blue rectangle at (195, 103) with width 80 and height 97.
; PLAN: r0=195(x), r1=103(y), r2=80(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 103
LDI r2, 80
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
