; DESCRIPTION: Draws a purple rectangle at (246, 164) with width 117 and height 30.
; PLAN: r0=246(x), r1=164(y), r2=117(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 164
LDI r2, 117
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
