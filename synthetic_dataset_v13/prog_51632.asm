; DESCRIPTION: Draws a blue rectangle at (56, 21) with width 115 and height 115.
; PLAN: r0=56(x), r1=21(y), r2=115(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 21
LDI r2, 115
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
