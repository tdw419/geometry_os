; DESCRIPTION: Draws a green rectangle at (339, 18) with width 111 and height 51.
; PLAN: r0=339(x), r1=18(y), r2=111(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 18
LDI r2, 111
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
