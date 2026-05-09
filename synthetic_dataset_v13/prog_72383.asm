; DESCRIPTION: Draws a purple rectangle at (252, 131) with width 98 and height 15.
; PLAN: r0=252(x), r1=131(y), r2=98(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 131
LDI r2, 98
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
