; DESCRIPTION: Draws a green rectangle at (433, 170) with width 74 and height 76.
; PLAN: r0=433(x), r1=170(y), r2=74(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 170
LDI r2, 74
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
