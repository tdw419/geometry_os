; DESCRIPTION: Draws a black rectangle at (84, 84) with width 70 and height 31.
; PLAN: r0=84(x), r1=84(y), r2=70(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 84
LDI r2, 70
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
