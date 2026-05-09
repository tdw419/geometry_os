; DESCRIPTION: Draws a purple rectangle at (294, 170) with width 37 and height 21.
; PLAN: r0=294(x), r1=170(y), r2=37(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 170
LDI r2, 37
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
