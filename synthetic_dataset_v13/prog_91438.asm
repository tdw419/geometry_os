; DESCRIPTION: Draws a purple rectangle at (152, 180) with width 19 and height 66.
; PLAN: r0=152(x), r1=180(y), r2=19(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 180
LDI r2, 19
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
