; DESCRIPTION: Draws a yellow rectangle at (100, 117) with width 44 and height 52.
; PLAN: r0=100(x), r1=117(y), r2=44(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 117
LDI r2, 44
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
