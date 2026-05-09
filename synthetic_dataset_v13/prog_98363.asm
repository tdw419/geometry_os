; DESCRIPTION: Draws a green rectangle at (304, 118) with width 51 and height 120.
; PLAN: r0=304(x), r1=118(y), r2=51(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 118
LDI r2, 51
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
