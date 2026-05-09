; DESCRIPTION: Draws a blue rectangle at (11, 68) with width 63 and height 53.
; PLAN: r0=11(x), r1=68(y), r2=63(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 68
LDI r2, 63
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
