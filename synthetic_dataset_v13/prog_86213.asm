; DESCRIPTION: Draws a blue rectangle at (391, 31) with width 99 and height 84.
; PLAN: r0=391(x), r1=31(y), r2=99(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 31
LDI r2, 99
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
