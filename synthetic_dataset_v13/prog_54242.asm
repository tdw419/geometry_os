; DESCRIPTION: Draws a blue rectangle at (369, 20) with width 104 and height 50.
; PLAN: r0=369(x), r1=20(y), r2=104(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 20
LDI r2, 104
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
