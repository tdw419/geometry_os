; DESCRIPTION: Draws a blue rectangle at (402, 4) with width 24 and height 55.
; PLAN: r0=402(x), r1=4(y), r2=24(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 4
LDI r2, 24
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
