; DESCRIPTION: Draws a purple rectangle at (448, 55) with width 18 and height 48.
; PLAN: r0=448(x), r1=55(y), r2=18(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 55
LDI r2, 18
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
