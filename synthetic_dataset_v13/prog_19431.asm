; DESCRIPTION: Draws a blue rectangle at (371, 163) with width 37 and height 50.
; PLAN: r0=371(x), r1=163(y), r2=37(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 163
LDI r2, 37
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
