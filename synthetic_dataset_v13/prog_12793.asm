; DESCRIPTION: Draws a purple rectangle at (205, 161) with width 25 and height 76.
; PLAN: r0=205(x), r1=161(y), r2=25(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 161
LDI r2, 25
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
