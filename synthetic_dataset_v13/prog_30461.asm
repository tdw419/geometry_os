; DESCRIPTION: Draws a white rectangle at (452, 170) with width 44 and height 71.
; PLAN: r0=452(x), r1=170(y), r2=44(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 170
LDI r2, 44
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
