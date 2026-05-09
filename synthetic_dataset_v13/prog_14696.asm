; DESCRIPTION: Draws a purple rectangle at (391, 136) with width 30 and height 20.
; PLAN: r0=391(x), r1=136(y), r2=30(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 136
LDI r2, 30
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
