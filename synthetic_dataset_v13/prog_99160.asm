; DESCRIPTION: Draws a purple rectangle at (326, 87) with width 29 and height 86.
; PLAN: r0=326(x), r1=87(y), r2=29(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 87
LDI r2, 29
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
