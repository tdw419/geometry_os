; DESCRIPTION: Draws a purple rectangle at (404, 74) with width 41 and height 88.
; PLAN: r0=404(x), r1=74(y), r2=41(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 74
LDI r2, 41
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
