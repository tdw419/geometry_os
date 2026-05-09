; DESCRIPTION: Draws a purple rectangle at (429, 56) with width 11 and height 64.
; PLAN: r0=429(x), r1=56(y), r2=11(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 56
LDI r2, 11
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
