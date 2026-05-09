; DESCRIPTION: Draws a blue rectangle at (343, 131) with width 117 and height 40.
; PLAN: r0=343(x), r1=131(y), r2=117(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 131
LDI r2, 117
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
