; DESCRIPTION: Draws a yellow rectangle at (342, 1) with width 114 and height 55.
; PLAN: r0=342(x), r1=1(y), r2=114(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 1
LDI r2, 114
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
