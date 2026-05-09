; DESCRIPTION: Draws a black rectangle at (190, 33) with width 51 and height 77.
; PLAN: r0=190(x), r1=33(y), r2=51(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 33
LDI r2, 51
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
