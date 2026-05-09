; DESCRIPTION: Draws a purple rectangle at (409, 162) with width 68 and height 56.
; PLAN: r0=409(x), r1=162(y), r2=68(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 162
LDI r2, 68
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
