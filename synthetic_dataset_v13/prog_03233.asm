; DESCRIPTION: Draws a purple rectangle at (349, 171) with width 110 and height 74.
; PLAN: r0=349(x), r1=171(y), r2=110(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 171
LDI r2, 110
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
