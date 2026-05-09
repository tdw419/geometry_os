; DESCRIPTION: Draws a white rectangle at (314, 170) with width 32 and height 72.
; PLAN: r0=314(x), r1=170(y), r2=32(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 170
LDI r2, 32
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
