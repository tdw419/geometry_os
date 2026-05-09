; DESCRIPTION: Draws a blue rectangle at (112, 138) with width 96 and height 29.
; PLAN: r0=112(x), r1=138(y), r2=96(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 138
LDI r2, 96
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
