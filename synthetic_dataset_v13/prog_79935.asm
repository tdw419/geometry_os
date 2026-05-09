; DESCRIPTION: Draws a purple rectangle at (37, 13) with width 30 and height 80.
; PLAN: r0=37(x), r1=13(y), r2=30(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 13
LDI r2, 30
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
