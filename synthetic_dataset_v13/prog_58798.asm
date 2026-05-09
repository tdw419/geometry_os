; DESCRIPTION: Draws a purple rectangle at (3, 161) with width 25 and height 86.
; PLAN: r0=3(x), r1=161(y), r2=25(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 161
LDI r2, 25
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
