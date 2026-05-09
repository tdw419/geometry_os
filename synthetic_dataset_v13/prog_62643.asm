; DESCRIPTION: Draws a purple rectangle at (418, 98) with width 20 and height 100.
; PLAN: r0=418(x), r1=98(y), r2=20(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 98
LDI r2, 20
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
