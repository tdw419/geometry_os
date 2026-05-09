; DESCRIPTION: Draws a purple rectangle at (315, 33) with width 63 and height 85.
; PLAN: r0=315(x), r1=33(y), r2=63(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 33
LDI r2, 63
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
