; DESCRIPTION: Draws a purple rectangle at (373, 83) with width 91 and height 97.
; PLAN: r0=373(x), r1=83(y), r2=91(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 83
LDI r2, 91
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
