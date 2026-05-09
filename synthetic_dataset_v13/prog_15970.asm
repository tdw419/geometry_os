; DESCRIPTION: Draws a blue rectangle at (411, 60) with width 77 and height 110.
; PLAN: r0=411(x), r1=60(y), r2=77(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 60
LDI r2, 77
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
