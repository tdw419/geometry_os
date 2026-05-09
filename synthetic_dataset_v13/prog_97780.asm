; DESCRIPTION: Draws a black rectangle at (448, 167) with width 47 and height 52.
; PLAN: r0=448(x), r1=167(y), r2=47(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 167
LDI r2, 47
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
