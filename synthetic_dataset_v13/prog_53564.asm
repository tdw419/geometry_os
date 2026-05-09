; DESCRIPTION: Draws a red rectangle at (448, 10) with width 19 and height 81.
; PLAN: r0=448(x), r1=10(y), r2=19(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 10
LDI r2, 19
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
