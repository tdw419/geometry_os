; DESCRIPTION: Draws a purple rectangle at (34, 202) with width 19 and height 37.
; PLAN: r0=34(x), r1=202(y), r2=19(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 202
LDI r2, 19
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
