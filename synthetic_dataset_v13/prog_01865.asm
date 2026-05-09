; DESCRIPTION: Draws a purple rectangle at (54, 74) with width 116 and height 37.
; PLAN: r0=54(x), r1=74(y), r2=116(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 74
LDI r2, 116
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
