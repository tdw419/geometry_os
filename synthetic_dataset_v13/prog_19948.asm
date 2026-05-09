; DESCRIPTION: Draws a purple rectangle at (173, 170) with width 78 and height 81.
; PLAN: r0=173(x), r1=170(y), r2=78(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 170
LDI r2, 78
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
