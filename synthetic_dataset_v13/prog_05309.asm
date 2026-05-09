; DESCRIPTION: Draws a purple rectangle at (429, 53) with width 63 and height 84.
; PLAN: r0=429(x), r1=53(y), r2=63(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 53
LDI r2, 63
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
