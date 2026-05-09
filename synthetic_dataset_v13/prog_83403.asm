; DESCRIPTION: Draws a purple rectangle at (98, 74) with width 21 and height 19.
; PLAN: r0=98(x), r1=74(y), r2=21(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 74
LDI r2, 21
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
