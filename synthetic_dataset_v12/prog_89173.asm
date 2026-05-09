; DESCRIPTION: Draws a purple rectangle at (13, 55) with width 19 and height 46.
; PLAN: r0=13(x), r1=55(y), r2=19(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 55
LDI r2, 19
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
