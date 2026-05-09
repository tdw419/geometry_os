; DESCRIPTION: Draws a purple rectangle at (287, 50) with width 26 and height 104.
; PLAN: r0=287(x), r1=50(y), r2=26(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 50
LDI r2, 26
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
