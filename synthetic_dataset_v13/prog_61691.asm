; DESCRIPTION: Draws a purple rectangle at (165, 119) with width 50 and height 18.
; PLAN: r0=165(x), r1=119(y), r2=50(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 119
LDI r2, 50
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
