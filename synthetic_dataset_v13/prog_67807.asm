; DESCRIPTION: Draws a yellow rectangle at (355, 9) with width 112 and height 31.
; PLAN: r0=355(x), r1=9(y), r2=112(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 9
LDI r2, 112
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
