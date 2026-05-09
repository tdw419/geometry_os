; DESCRIPTION: Draws a yellow rectangle at (84, 47) with width 92 and height 18.
; PLAN: r0=84(x), r1=47(y), r2=92(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 47
LDI r2, 92
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
