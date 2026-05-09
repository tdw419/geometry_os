; DESCRIPTION: Draws a blue rectangle at (138, 75) with width 38 and height 33.
; PLAN: r0=138(x), r1=75(y), r2=38(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 75
LDI r2, 38
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
