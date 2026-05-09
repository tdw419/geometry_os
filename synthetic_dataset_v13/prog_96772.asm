; DESCRIPTION: Draws a blue rectangle at (165, 131) with width 114 and height 13.
; PLAN: r0=165(x), r1=131(y), r2=114(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 131
LDI r2, 114
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
