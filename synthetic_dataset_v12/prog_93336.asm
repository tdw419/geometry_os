; DESCRIPTION: Draws a green rectangle at (107, 83) with width 37 and height 34.
; PLAN: r0=107(x), r1=83(y), r2=37(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 83
LDI r2, 37
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
