; DESCRIPTION: Draws a yellow rectangle at (111, 123) with width 93 and height 15.
; PLAN: r0=111(x), r1=123(y), r2=93(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 123
LDI r2, 93
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
