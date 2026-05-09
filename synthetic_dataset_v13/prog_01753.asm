; DESCRIPTION: Draws a green rectangle at (304, 198) with width 12 and height 51.
; PLAN: r0=304(x), r1=198(y), r2=12(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 198
LDI r2, 12
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
