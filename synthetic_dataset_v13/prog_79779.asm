; DESCRIPTION: Draws a purple rectangle at (237, 162) with width 36 and height 85.
; PLAN: r0=237(x), r1=162(y), r2=36(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 162
LDI r2, 36
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
