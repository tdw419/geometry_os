; DESCRIPTION: Draws a purple rectangle at (354, 84) with width 76 and height 50.
; PLAN: r0=354(x), r1=84(y), r2=76(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 84
LDI r2, 76
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
