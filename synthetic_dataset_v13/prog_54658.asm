; DESCRIPTION: Draws a blue rectangle at (220, 60) with width 51 and height 104.
; PLAN: r0=220(x), r1=60(y), r2=51(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 60
LDI r2, 51
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
