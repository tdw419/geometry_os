; DESCRIPTION: Draws a yellow rectangle at (144, 148) with width 52 and height 98.
; PLAN: r0=144(x), r1=148(y), r2=52(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 148
LDI r2, 52
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
