; DESCRIPTION: Draws a blue rectangle at (22, 188) with width 28 and height 53.
; PLAN: r0=22(x), r1=188(y), r2=28(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 188
LDI r2, 28
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
