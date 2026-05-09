; DESCRIPTION: Draws a purple rectangle at (57, 161) with width 25 and height 54.
; PLAN: r0=57(x), r1=161(y), r2=25(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 161
LDI r2, 25
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
