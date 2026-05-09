; DESCRIPTION: Draws a red rectangle at (77, 110) with width 17 and height 90.
; PLAN: r0=77(x), r1=110(y), r2=17(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 110
LDI r2, 17
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
