; DESCRIPTION: Draws a blue rectangle at (433, 140) with width 51 and height 49.
; PLAN: r0=433(x), r1=140(y), r2=51(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 140
LDI r2, 51
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
