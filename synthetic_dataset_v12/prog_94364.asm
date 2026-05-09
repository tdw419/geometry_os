; DESCRIPTION: Draws a blue rectangle at (121, 104) with width 54 and height 86.
; PLAN: r0=121(x), r1=104(y), r2=54(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 104
LDI r2, 54
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
