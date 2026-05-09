; DESCRIPTION: Draws a yellow rectangle at (269, 100) with width 25 and height 44.
; PLAN: r0=269(x), r1=100(y), r2=25(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 100
LDI r2, 25
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
