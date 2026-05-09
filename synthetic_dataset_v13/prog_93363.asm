; DESCRIPTION: Draws a purple rectangle at (200, 50) with width 46 and height 92.
; PLAN: r0=200(x), r1=50(y), r2=46(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 50
LDI r2, 46
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
