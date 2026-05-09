; DESCRIPTION: Draws a blue rectangle at (278, 72) with width 70 and height 104.
; PLAN: r0=278(x), r1=72(y), r2=70(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 72
LDI r2, 70
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
