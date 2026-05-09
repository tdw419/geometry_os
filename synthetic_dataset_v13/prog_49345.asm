; DESCRIPTION: Draws a blue rectangle at (290, 170) with width 55 and height 35.
; PLAN: r0=290(x), r1=170(y), r2=55(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 170
LDI r2, 55
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
