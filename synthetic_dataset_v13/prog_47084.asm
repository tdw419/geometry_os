; DESCRIPTION: Draws a blue rectangle at (73, 119) with width 47 and height 19.
; PLAN: r0=73(x), r1=119(y), r2=47(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 119
LDI r2, 47
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
