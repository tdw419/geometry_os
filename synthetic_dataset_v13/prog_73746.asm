; DESCRIPTION: Draws a purple rectangle at (218, 86) with width 70 and height 107.
; PLAN: r0=218(x), r1=86(y), r2=70(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 86
LDI r2, 70
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
