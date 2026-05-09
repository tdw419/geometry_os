; DESCRIPTION: Draws a white rectangle at (118, 77) with width 46 and height 77.
; PLAN: r0=118(x), r1=77(y), r2=46(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 77
LDI r2, 46
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
