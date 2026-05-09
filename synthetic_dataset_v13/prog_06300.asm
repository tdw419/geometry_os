; DESCRIPTION: Draws a purple rectangle at (270, 225) with width 74 and height 29.
; PLAN: r0=270(x), r1=225(y), r2=74(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 225
LDI r2, 74
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
