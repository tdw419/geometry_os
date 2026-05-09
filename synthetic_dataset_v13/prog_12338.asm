; DESCRIPTION: Draws a blue rectangle at (86, 217) with width 11 and height 23.
; PLAN: r0=86(x), r1=217(y), r2=11(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 217
LDI r2, 11
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
