; DESCRIPTION: Draws a yellow rectangle at (366, 43) with width 49 and height 98.
; PLAN: r0=366(x), r1=43(y), r2=49(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 43
LDI r2, 49
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
