; DESCRIPTION: Draws a blue rectangle at (361, 47) with width 96 and height 118.
; PLAN: r0=361(x), r1=47(y), r2=96(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 47
LDI r2, 96
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
