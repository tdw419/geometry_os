; DESCRIPTION: Draws a blue rectangle at (480, 89) with width 25 and height 96.
; PLAN: r0=480(x), r1=89(y), r2=25(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 89
LDI r2, 25
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
