; DESCRIPTION: Draws a purple rectangle at (364, 178) with width 25 and height 12.
; PLAN: r0=364(x), r1=178(y), r2=25(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 178
LDI r2, 25
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
