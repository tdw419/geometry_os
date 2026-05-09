; DESCRIPTION: Draws a purple rectangle at (429, 90) with width 63 and height 11.
; PLAN: r0=429(x), r1=90(y), r2=63(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 90
LDI r2, 63
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
