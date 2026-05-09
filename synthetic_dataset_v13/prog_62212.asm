; DESCRIPTION: Draws a white rectangle at (192, 170) with width 30 and height 23.
; PLAN: r0=192(x), r1=170(y), r2=30(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 170
LDI r2, 30
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
