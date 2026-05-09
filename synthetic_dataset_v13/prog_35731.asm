; DESCRIPTION: Draws a green rectangle at (129, 178) with width 51 and height 39.
; PLAN: r0=129(x), r1=178(y), r2=51(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 178
LDI r2, 51
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
