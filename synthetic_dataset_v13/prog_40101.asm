; DESCRIPTION: Draws a yellow rectangle at (156, 114) with width 15 and height 70.
; PLAN: r0=156(x), r1=114(y), r2=15(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 114
LDI r2, 15
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
