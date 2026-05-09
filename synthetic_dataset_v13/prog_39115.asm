; DESCRIPTION: Draws a blue rectangle at (440, 23) with width 24 and height 79.
; PLAN: r0=440(x), r1=23(y), r2=24(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 23
LDI r2, 24
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
