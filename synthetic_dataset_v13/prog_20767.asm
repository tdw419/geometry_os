; DESCRIPTION: Draws a blue rectangle at (56, 91) with width 56 and height 53.
; PLAN: r0=56(x), r1=91(y), r2=56(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 91
LDI r2, 56
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
