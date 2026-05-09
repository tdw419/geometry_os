; DESCRIPTION: Draws a green rectangle at (361, 136) with width 74 and height 81.
; PLAN: r0=361(x), r1=136(y), r2=74(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 136
LDI r2, 74
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
