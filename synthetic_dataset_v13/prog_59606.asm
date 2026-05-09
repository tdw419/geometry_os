; DESCRIPTION: Draws a blue rectangle at (188, 162) with width 12 and height 39.
; PLAN: r0=188(x), r1=162(y), r2=12(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 162
LDI r2, 12
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
