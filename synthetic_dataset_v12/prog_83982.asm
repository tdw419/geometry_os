; DESCRIPTION: Draws a blue rectangle at (210, 118) with width 85 and height 73.
; PLAN: r0=210(x), r1=118(y), r2=85(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 118
LDI r2, 85
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
