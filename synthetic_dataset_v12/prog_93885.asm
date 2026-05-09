; DESCRIPTION: Draws a blue rectangle at (315, 131) with width 48 and height 74.
; PLAN: r0=315(x), r1=131(y), r2=48(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 131
LDI r2, 48
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
