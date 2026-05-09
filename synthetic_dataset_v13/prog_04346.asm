; DESCRIPTION: Draws a blue rectangle at (332, 145) with width 36 and height 104.
; PLAN: r0=332(x), r1=145(y), r2=36(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 145
LDI r2, 36
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
