; DESCRIPTION: Draws a blue rectangle at (79, 141) with width 99 and height 51.
; PLAN: r0=79(x), r1=141(y), r2=99(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 141
LDI r2, 99
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
