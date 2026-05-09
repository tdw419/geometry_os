; DESCRIPTION: Draws a black rectangle at (283, 199) with width 117 and height 37.
; PLAN: r0=283(x), r1=199(y), r2=117(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 199
LDI r2, 117
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
