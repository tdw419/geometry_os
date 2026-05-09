; DESCRIPTION: Draws a green rectangle at (313, 109) with width 51 and height 33.
; PLAN: r0=313(x), r1=109(y), r2=51(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 109
LDI r2, 51
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
