; DESCRIPTION: Draws a green rectangle at (68, 72) with width 51 and height 30.
; PLAN: r0=68(x), r1=72(y), r2=51(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 72
LDI r2, 51
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
