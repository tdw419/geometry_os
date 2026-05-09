; DESCRIPTION: Draws a purple rectangle at (40, 69) with width 60 and height 12.
; PLAN: r0=40(x), r1=69(y), r2=60(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 69
LDI r2, 60
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
