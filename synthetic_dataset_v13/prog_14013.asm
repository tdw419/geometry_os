; DESCRIPTION: Draws a green rectangle at (51, 60) with width 57 and height 116.
; PLAN: r0=51(x), r1=60(y), r2=57(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 60
LDI r2, 57
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
