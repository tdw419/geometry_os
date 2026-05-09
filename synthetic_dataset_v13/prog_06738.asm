; DESCRIPTION: Draws a purple rectangle at (127, 122) with width 120 and height 89.
; PLAN: r0=127(x), r1=122(y), r2=120(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 122
LDI r2, 120
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
