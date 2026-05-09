; DESCRIPTION: Draws a blue rectangle at (267, 55) with width 51 and height 48.
; PLAN: r0=267(x), r1=55(y), r2=51(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 55
LDI r2, 51
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
