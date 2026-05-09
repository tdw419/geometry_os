; DESCRIPTION: Draws a black rectangle at (209, 170) with width 36 and height 76.
; PLAN: r0=209(x), r1=170(y), r2=36(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 170
LDI r2, 36
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
