; DESCRIPTION: Draws a purple rectangle at (70, 72) with width 60 and height 84.
; PLAN: r0=70(x), r1=72(y), r2=60(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 72
LDI r2, 60
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
