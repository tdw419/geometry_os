; DESCRIPTION: Draws a yellow rectangle at (194, 30) with width 116 and height 59.
; PLAN: r0=194(x), r1=30(y), r2=116(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 30
LDI r2, 116
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
