; DESCRIPTION: Draws a blue rectangle at (74, 49) with width 59 and height 49.
; PLAN: r0=74(x), r1=49(y), r2=59(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 49
LDI r2, 59
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
