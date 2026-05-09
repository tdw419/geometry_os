; DESCRIPTION: Draws a purple rectangle at (283, 90) with width 24 and height 104.
; PLAN: r0=283(x), r1=90(y), r2=24(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 90
LDI r2, 24
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
