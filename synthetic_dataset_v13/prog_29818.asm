; DESCRIPTION: Draws a blue rectangle at (25, 80) with width 47 and height 74.
; PLAN: r0=25(x), r1=80(y), r2=47(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 80
LDI r2, 47
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
