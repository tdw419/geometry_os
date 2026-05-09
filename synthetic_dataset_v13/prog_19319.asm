; DESCRIPTION: Draws a blue rectangle at (0, 142) with width 61 and height 81.
; PLAN: r0=0(x), r1=142(y), r2=61(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 142
LDI r2, 61
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
