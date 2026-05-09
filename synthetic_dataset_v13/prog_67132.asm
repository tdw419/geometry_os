; DESCRIPTION: Draws a purple rectangle at (323, 24) with width 39 and height 70.
; PLAN: r0=323(x), r1=24(y), r2=39(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 24
LDI r2, 39
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
