; DESCRIPTION: Draws a blue rectangle at (99, 16) with width 19 and height 35.
; PLAN: r0=99(x), r1=16(y), r2=19(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 16
LDI r2, 19
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
