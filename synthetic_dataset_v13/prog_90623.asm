; DESCRIPTION: Draws a white rectangle at (204, 170) with width 59 and height 65.
; PLAN: r0=204(x), r1=170(y), r2=59(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 170
LDI r2, 59
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
