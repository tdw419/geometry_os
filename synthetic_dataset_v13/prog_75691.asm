; DESCRIPTION: Draws a blue rectangle at (360, 68) with width 69 and height 51.
; PLAN: r0=360(x), r1=68(y), r2=69(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 68
LDI r2, 69
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
