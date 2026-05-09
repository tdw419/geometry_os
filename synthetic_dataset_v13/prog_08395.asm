; DESCRIPTION: Draws a yellow rectangle at (163, 112) with width 117 and height 33.
; PLAN: r0=163(x), r1=112(y), r2=117(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 112
LDI r2, 117
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
