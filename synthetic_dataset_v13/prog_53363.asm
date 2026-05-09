; DESCRIPTION: Draws a blue rectangle at (137, 60) with width 79 and height 18.
; PLAN: r0=137(x), r1=60(y), r2=79(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 60
LDI r2, 79
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
