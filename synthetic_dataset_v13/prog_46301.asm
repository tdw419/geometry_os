; DESCRIPTION: Draws a blue rectangle at (11, 138) with width 29 and height 107.
; PLAN: r0=11(x), r1=138(y), r2=29(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 138
LDI r2, 29
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
