; DESCRIPTION: Draws a purple rectangle at (213, 77) with width 85 and height 104.
; PLAN: r0=213(x), r1=77(y), r2=85(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 77
LDI r2, 85
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
