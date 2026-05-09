; DESCRIPTION: Draws a blue rectangle at (221, 15) with width 104 and height 24.
; PLAN: r0=221(x), r1=15(y), r2=104(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 15
LDI r2, 104
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
