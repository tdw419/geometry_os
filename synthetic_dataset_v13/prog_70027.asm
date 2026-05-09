; DESCRIPTION: Draws a blue rectangle at (261, 192) with width 35 and height 50.
; PLAN: r0=261(x), r1=192(y), r2=35(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 192
LDI r2, 35
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
