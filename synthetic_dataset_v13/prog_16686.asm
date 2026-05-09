; DESCRIPTION: Draws a yellow rectangle at (80, 156) with width 116 and height 69.
; PLAN: r0=80(x), r1=156(y), r2=116(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 156
LDI r2, 116
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
