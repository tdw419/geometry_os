; DESCRIPTION: Draws a purple rectangle at (127, 86) with width 52 and height 65.
; PLAN: r0=127(x), r1=86(y), r2=52(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 86
LDI r2, 52
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
