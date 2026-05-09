; DESCRIPTION: Draws a yellow rectangle at (89, 3) with width 92 and height 103.
; PLAN: r0=89(x), r1=3(y), r2=92(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 3
LDI r2, 92
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
