; DESCRIPTION: Draws a purple rectangle at (292, 62) with width 13 and height 60.
; PLAN: r0=292(x), r1=62(y), r2=13(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 62
LDI r2, 13
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
