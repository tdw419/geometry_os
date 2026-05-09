; DESCRIPTION: Draws a black rectangle at (60, 170) with width 20 and height 12.
; PLAN: r0=60(x), r1=170(y), r2=20(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 170
LDI r2, 20
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
