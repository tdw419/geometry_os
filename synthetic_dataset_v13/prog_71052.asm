; DESCRIPTION: Draws a purple rectangle at (208, 70) with width 54 and height 51.
; PLAN: r0=208(x), r1=70(y), r2=54(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 70
LDI r2, 54
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
