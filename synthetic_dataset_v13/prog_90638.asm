; DESCRIPTION: Draws a blue rectangle at (119, 75) with width 120 and height 51.
; PLAN: r0=119(x), r1=75(y), r2=120(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 75
LDI r2, 120
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
