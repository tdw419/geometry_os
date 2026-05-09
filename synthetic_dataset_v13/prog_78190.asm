; DESCRIPTION: Draws a yellow rectangle at (69, 71) with width 114 and height 95.
; PLAN: r0=69(x), r1=71(y), r2=114(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 71
LDI r2, 114
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
