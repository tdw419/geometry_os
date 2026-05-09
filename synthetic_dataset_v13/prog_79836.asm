; DESCRIPTION: Draws a purple rectangle at (454, 132) with width 47 and height 83.
; PLAN: r0=454(x), r1=132(y), r2=47(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 132
LDI r2, 47
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
