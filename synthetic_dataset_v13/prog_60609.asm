; DESCRIPTION: Draws a purple rectangle at (328, 178) with width 35 and height 13.
; PLAN: r0=328(x), r1=178(y), r2=35(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 178
LDI r2, 35
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
