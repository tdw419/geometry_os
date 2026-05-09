; DESCRIPTION: Draws a purple rectangle at (290, 139) with width 34 and height 54.
; PLAN: r0=290(x), r1=139(y), r2=34(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 139
LDI r2, 34
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
