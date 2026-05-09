; DESCRIPTION: Draws a purple rectangle at (75, 104) with width 47 and height 46.
; PLAN: r0=75(x), r1=104(y), r2=47(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 104
LDI r2, 47
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
