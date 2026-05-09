; DESCRIPTION: Draws a blue rectangle at (414, 89) with width 27 and height 97.
; PLAN: r0=414(x), r1=89(y), r2=27(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 89
LDI r2, 27
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
