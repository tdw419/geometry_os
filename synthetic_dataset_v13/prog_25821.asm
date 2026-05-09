; DESCRIPTION: Draws a red rectangle at (355, 170) with width 100 and height 59.
; PLAN: r0=355(x), r1=170(y), r2=100(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 170
LDI r2, 100
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
