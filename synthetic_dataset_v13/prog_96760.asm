; DESCRIPTION: Draws a yellow rectangle at (19, 94) with width 105 and height 40.
; PLAN: r0=19(x), r1=94(y), r2=105(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 94
LDI r2, 105
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
