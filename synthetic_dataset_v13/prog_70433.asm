; DESCRIPTION: Draws a yellow rectangle at (172, 148) with width 14 and height 81.
; PLAN: r0=172(x), r1=148(y), r2=14(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 148
LDI r2, 14
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
