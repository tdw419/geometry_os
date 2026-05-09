; DESCRIPTION: Draws a green rectangle at (314, 98) with width 51 and height 24.
; PLAN: r0=314(x), r1=98(y), r2=51(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 98
LDI r2, 51
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
