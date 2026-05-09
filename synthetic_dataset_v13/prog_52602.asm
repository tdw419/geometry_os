; DESCRIPTION: Draws a purple rectangle at (98, 16) with width 35 and height 49.
; PLAN: r0=98(x), r1=16(y), r2=35(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 16
LDI r2, 35
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
