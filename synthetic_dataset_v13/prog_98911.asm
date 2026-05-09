; DESCRIPTION: Draws a blue rectangle at (2, 119) with width 70 and height 117.
; PLAN: r0=2(x), r1=119(y), r2=70(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 119
LDI r2, 70
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
