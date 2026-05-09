; DESCRIPTION: Draws a purple rectangle at (284, 155) with width 68 and height 66.
; PLAN: r0=284(x), r1=155(y), r2=68(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 155
LDI r2, 68
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
