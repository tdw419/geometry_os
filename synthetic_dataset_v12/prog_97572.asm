; DESCRIPTION: Draws a yellow rectangle at (93, 170) with width 23 and height 54.
; PLAN: r0=93(x), r1=170(y), r2=23(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 170
LDI r2, 23
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
