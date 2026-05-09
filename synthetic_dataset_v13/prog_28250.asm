; DESCRIPTION: Draws a purple rectangle at (264, 5) with width 103 and height 49.
; PLAN: r0=264(x), r1=5(y), r2=103(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 5
LDI r2, 103
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
