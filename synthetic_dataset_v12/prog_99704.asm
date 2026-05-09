; DESCRIPTION: Draws a purple rectangle at (319, 120) with width 21 and height 110.
; PLAN: r0=319(x), r1=120(y), r2=21(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 120
LDI r2, 21
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
