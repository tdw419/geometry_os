; DESCRIPTION: Draws a blue rectangle at (421, 89) with width 86 and height 49.
; PLAN: r0=421(x), r1=89(y), r2=86(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 89
LDI r2, 86
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
