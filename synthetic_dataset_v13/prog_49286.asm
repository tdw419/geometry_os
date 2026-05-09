; DESCRIPTION: Draws a purple rectangle at (34, 188) with width 50 and height 50.
; PLAN: r0=34(x), r1=188(y), r2=50(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 188
LDI r2, 50
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
