; DESCRIPTION: Draws a yellow rectangle at (35, 58) with width 116 and height 96.
; PLAN: r0=35(x), r1=58(y), r2=116(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 58
LDI r2, 116
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
