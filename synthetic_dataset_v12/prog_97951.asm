; DESCRIPTION: Draws a purple rectangle at (78, 164) with width 28 and height 45.
; PLAN: r0=78(x), r1=164(y), r2=28(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 164
LDI r2, 28
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
