; DESCRIPTION: Draws a blue rectangle at (289, 6) with width 74 and height 104.
; PLAN: r0=289(x), r1=6(y), r2=74(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 6
LDI r2, 74
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
