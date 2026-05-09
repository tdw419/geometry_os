; DESCRIPTION: Draws a purple rectangle at (127, 28) with width 40 and height 74.
; PLAN: r0=127(x), r1=28(y), r2=40(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 28
LDI r2, 40
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
