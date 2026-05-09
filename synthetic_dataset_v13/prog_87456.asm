; DESCRIPTION: Draws a yellow rectangle at (288, 55) with width 92 and height 66.
; PLAN: r0=288(x), r1=55(y), r2=92(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 55
LDI r2, 92
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
