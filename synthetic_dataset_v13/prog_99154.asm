; DESCRIPTION: Draws a purple rectangle at (10, 4) with width 18 and height 55.
; PLAN: r0=10(x), r1=4(y), r2=18(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 4
LDI r2, 18
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
