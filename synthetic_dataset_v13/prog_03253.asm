; DESCRIPTION: Draws a purple rectangle at (158, 117) with width 102 and height 111.
; PLAN: r0=158(x), r1=117(y), r2=102(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 117
LDI r2, 102
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
