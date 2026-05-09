; DESCRIPTION: Draws a purple rectangle at (303, 15) with width 28 and height 76.
; PLAN: r0=303(x), r1=15(y), r2=28(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 15
LDI r2, 28
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
