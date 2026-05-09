; DESCRIPTION: Draws a purple rectangle at (60, 44) with width 80 and height 84.
; PLAN: r0=60(x), r1=44(y), r2=80(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 44
LDI r2, 80
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
