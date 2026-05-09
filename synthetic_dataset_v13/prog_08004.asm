; DESCRIPTION: Draws a purple rectangle at (264, 20) with width 82 and height 110.
; PLAN: r0=264(x), r1=20(y), r2=82(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 20
LDI r2, 82
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
