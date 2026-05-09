; DESCRIPTION: Draws a blue rectangle at (223, 73) with width 74 and height 22.
; PLAN: r0=223(x), r1=73(y), r2=74(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 73
LDI r2, 74
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
