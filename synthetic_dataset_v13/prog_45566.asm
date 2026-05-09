; DESCRIPTION: Draws a purple rectangle at (127, 137) with width 49 and height 117.
; PLAN: r0=127(x), r1=137(y), r2=49(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 137
LDI r2, 49
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
