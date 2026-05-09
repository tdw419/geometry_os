; DESCRIPTION: Draws a yellow rectangle at (118, 8) with width 18 and height 117.
; PLAN: r0=118(x), r1=8(y), r2=18(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 8
LDI r2, 18
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
