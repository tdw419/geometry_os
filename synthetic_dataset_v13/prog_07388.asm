; DESCRIPTION: Draws a blue rectangle at (3, 218) with width 63 and height 11.
; PLAN: r0=3(x), r1=218(y), r2=63(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 218
LDI r2, 63
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
