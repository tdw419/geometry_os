; DESCRIPTION: Draws a yellow rectangle at (233, 109) with width 68 and height 22.
; PLAN: r0=233(x), r1=109(y), r2=68(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 109
LDI r2, 68
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
