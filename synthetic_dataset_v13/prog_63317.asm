; DESCRIPTION: Draws a yellow rectangle at (208, 121) with width 92 and height 81.
; PLAN: r0=208(x), r1=121(y), r2=92(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 121
LDI r2, 92
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
