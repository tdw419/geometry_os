; DESCRIPTION: Draws a purple rectangle at (250, 124) with width 63 and height 65.
; PLAN: r0=250(x), r1=124(y), r2=63(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 124
LDI r2, 63
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
