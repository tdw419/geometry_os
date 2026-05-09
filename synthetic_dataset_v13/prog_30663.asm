; DESCRIPTION: Draws a purple rectangle at (170, 125) with width 115 and height 21.
; PLAN: r0=170(x), r1=125(y), r2=115(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 125
LDI r2, 115
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
