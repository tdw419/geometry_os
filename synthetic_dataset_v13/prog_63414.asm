; DESCRIPTION: Draws a purple rectangle at (376, 45) with width 28 and height 89.
; PLAN: r0=376(x), r1=45(y), r2=28(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 45
LDI r2, 28
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
