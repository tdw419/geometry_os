; DESCRIPTION: Draws a blue rectangle at (336, 201) with width 45 and height 55.
; PLAN: r0=336(x), r1=201(y), r2=45(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 201
LDI r2, 45
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
