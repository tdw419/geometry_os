; DESCRIPTION: Draws a blue rectangle at (165, 101) with width 31 and height 29.
; PLAN: r0=165(x), r1=101(y), r2=31(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 101
LDI r2, 31
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
