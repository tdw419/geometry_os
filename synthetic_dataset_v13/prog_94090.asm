; DESCRIPTION: Draws a purple rectangle at (78, 64) with width 57 and height 86.
; PLAN: r0=78(x), r1=64(y), r2=57(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 64
LDI r2, 57
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
