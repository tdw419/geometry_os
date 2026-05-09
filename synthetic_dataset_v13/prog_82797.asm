; DESCRIPTION: Draws a blue rectangle at (63, 144) with width 31 and height 100.
; PLAN: r0=63(x), r1=144(y), r2=31(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 144
LDI r2, 31
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
