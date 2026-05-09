; DESCRIPTION: Draws a purple rectangle at (290, 122) with width 34 and height 60.
; PLAN: r0=290(x), r1=122(y), r2=34(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 122
LDI r2, 34
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
