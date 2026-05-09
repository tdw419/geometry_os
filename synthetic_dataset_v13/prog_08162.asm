; DESCRIPTION: Draws a blue rectangle at (97, 135) with width 117 and height 64.
; PLAN: r0=97(x), r1=135(y), r2=117(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 135
LDI r2, 117
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
