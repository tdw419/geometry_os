; DESCRIPTION: Draws a yellow rectangle at (310, 65) with width 40 and height 94.
; PLAN: r0=310(x), r1=65(y), r2=40(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 65
LDI r2, 40
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
