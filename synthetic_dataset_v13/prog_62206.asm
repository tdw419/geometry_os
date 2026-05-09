; DESCRIPTION: Draws a yellow rectangle at (355, 11) with width 74 and height 118.
; PLAN: r0=355(x), r1=11(y), r2=74(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 11
LDI r2, 74
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
