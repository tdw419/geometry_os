; DESCRIPTION: Draws a purple rectangle at (417, 21) with width 13 and height 28.
; PLAN: r0=417(x), r1=21(y), r2=13(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 21
LDI r2, 13
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
