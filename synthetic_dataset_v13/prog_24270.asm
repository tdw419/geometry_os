; DESCRIPTION: Draws a yellow rectangle at (86, 75) with width 74 and height 119.
; PLAN: r0=86(x), r1=75(y), r2=74(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 75
LDI r2, 74
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
