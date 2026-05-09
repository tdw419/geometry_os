; DESCRIPTION: Draws a blue rectangle at (35, 164) with width 80 and height 75.
; PLAN: r0=35(x), r1=164(y), r2=80(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 164
LDI r2, 80
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
