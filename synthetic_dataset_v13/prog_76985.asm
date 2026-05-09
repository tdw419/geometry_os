; DESCRIPTION: Draws a blue rectangle at (31, 17) with width 104 and height 109.
; PLAN: r0=31(x), r1=17(y), r2=104(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 17
LDI r2, 104
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
