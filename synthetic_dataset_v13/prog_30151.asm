; DESCRIPTION: Draws a blue rectangle at (74, 139) with width 40 and height 28.
; PLAN: r0=74(x), r1=139(y), r2=40(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 139
LDI r2, 40
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
