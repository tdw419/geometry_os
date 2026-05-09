; DESCRIPTION: Draws a purple rectangle at (460, 55) with width 10 and height 88.
; PLAN: r0=460(x), r1=55(y), r2=10(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 55
LDI r2, 10
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
