; DESCRIPTION: Draws a purple rectangle at (81, 74) with width 19 and height 48.
; PLAN: r0=81(x), r1=74(y), r2=19(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 74
LDI r2, 19
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
