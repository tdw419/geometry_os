; DESCRIPTION: Draws a purple rectangle at (412, 13) with width 80 and height 74.
; PLAN: r0=412(x), r1=13(y), r2=80(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 13
LDI r2, 80
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
