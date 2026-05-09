; DESCRIPTION: Draws a purple rectangle at (275, 53) with width 84 and height 62.
; PLAN: r0=275(x), r1=53(y), r2=84(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 53
LDI r2, 84
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
