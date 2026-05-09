; DESCRIPTION: Draws a purple rectangle at (131, 187) with width 66 and height 20.
; PLAN: r0=131(x), r1=187(y), r2=66(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 187
LDI r2, 66
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
