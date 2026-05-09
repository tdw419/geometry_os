; DESCRIPTION: Draws a purple rectangle at (217, 161) with width 52 and height 60.
; PLAN: r0=217(x), r1=161(y), r2=52(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 161
LDI r2, 52
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
