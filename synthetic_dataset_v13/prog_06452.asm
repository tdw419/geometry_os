; DESCRIPTION: Draws a blue rectangle at (89, 27) with width 102 and height 29.
; PLAN: r0=89(x), r1=27(y), r2=102(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 27
LDI r2, 102
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
