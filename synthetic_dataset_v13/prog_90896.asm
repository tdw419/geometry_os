; DESCRIPTION: Draws a blue rectangle at (325, 56) with width 23 and height 56.
; PLAN: r0=325(x), r1=56(y), r2=23(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 56
LDI r2, 23
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
