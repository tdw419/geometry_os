; DESCRIPTION: Draws a yellow rectangle at (76, 25) with width 112 and height 44.
; PLAN: r0=76(x), r1=25(y), r2=112(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 25
LDI r2, 112
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
