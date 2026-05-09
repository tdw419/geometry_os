; DESCRIPTION: Draws a red rectangle at (344, 170) with width 28 and height 37.
; PLAN: r0=344(x), r1=170(y), r2=28(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 170
LDI r2, 28
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
