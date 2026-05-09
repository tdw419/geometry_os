; DESCRIPTION: Draws a yellow rectangle at (1, 178) with width 92 and height 65.
; PLAN: r0=1(x), r1=178(y), r2=92(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 178
LDI r2, 92
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
