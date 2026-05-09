; DESCRIPTION: Draws a purple rectangle at (194, 6) with width 60 and height 104.
; PLAN: r0=194(x), r1=6(y), r2=60(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 6
LDI r2, 60
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
