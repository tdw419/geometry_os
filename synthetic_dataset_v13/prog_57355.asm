; DESCRIPTION: Draws a yellow rectangle at (418, 145) with width 43 and height 35.
; PLAN: r0=418(x), r1=145(y), r2=43(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 145
LDI r2, 43
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
