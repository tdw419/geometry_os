; DESCRIPTION: Draws a purple rectangle at (99, 21) with width 86 and height 98.
; PLAN: r0=99(x), r1=21(y), r2=86(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 21
LDI r2, 86
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
