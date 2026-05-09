; DESCRIPTION: Draws a blue rectangle at (261, 124) with width 40 and height 55.
; PLAN: r0=261(x), r1=124(y), r2=40(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 124
LDI r2, 40
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
