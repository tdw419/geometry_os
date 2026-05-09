; DESCRIPTION: Draws a yellow rectangle at (72, 181) with width 23 and height 51.
; PLAN: r0=72(x), r1=181(y), r2=23(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 181
LDI r2, 23
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
