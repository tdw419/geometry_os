; DESCRIPTION: Draws a blue rectangle at (272, 23) with width 20 and height 74.
; PLAN: r0=272(x), r1=23(y), r2=20(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 23
LDI r2, 20
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
