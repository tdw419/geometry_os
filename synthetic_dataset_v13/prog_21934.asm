; DESCRIPTION: Draws a blue rectangle at (304, 87) with width 49 and height 63.
; PLAN: r0=304(x), r1=87(y), r2=49(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 87
LDI r2, 49
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
