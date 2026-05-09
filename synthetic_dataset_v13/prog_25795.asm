; DESCRIPTION: Draws a purple rectangle at (350, 67) with width 63 and height 78.
; PLAN: r0=350(x), r1=67(y), r2=63(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 67
LDI r2, 63
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
