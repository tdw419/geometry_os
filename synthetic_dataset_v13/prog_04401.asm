; DESCRIPTION: Draws a blue rectangle at (419, 149) with width 25 and height 55.
; PLAN: r0=419(x), r1=149(y), r2=25(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 149
LDI r2, 25
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
