; DESCRIPTION: Draws a blue rectangle at (39, 131) with width 30 and height 95.
; PLAN: r0=39(x), r1=131(y), r2=30(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 131
LDI r2, 30
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
