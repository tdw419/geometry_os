; DESCRIPTION: Draws a yellow rectangle at (37, 77) with width 19 and height 89.
; PLAN: r0=37(x), r1=77(y), r2=19(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 77
LDI r2, 19
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
