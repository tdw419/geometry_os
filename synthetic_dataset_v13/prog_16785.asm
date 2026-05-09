; DESCRIPTION: Draws a blue rectangle at (139, 20) with width 10 and height 45.
; PLAN: r0=139(x), r1=20(y), r2=10(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 20
LDI r2, 10
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
