; DESCRIPTION: Draws a purple rectangle at (91, 72) with width 84 and height 63.
; PLAN: r0=91(x), r1=72(y), r2=84(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 72
LDI r2, 84
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
