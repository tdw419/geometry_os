; DESCRIPTION: Draws a yellow rectangle at (420, 2) with width 25 and height 44.
; PLAN: r0=420(x), r1=2(y), r2=25(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 2
LDI r2, 25
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
