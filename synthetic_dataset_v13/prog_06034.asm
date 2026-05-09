; DESCRIPTION: Draws a blue rectangle at (56, 38) with width 45 and height 97.
; PLAN: r0=56(x), r1=38(y), r2=45(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 38
LDI r2, 45
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
