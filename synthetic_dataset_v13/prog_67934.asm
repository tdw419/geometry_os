; DESCRIPTION: Draws a blue rectangle at (250, 52) with width 91 and height 79.
; PLAN: r0=250(x), r1=52(y), r2=91(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 52
LDI r2, 91
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
