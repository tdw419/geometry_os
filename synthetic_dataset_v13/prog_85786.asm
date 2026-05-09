; DESCRIPTION: Draws a purple rectangle at (437, 77) with width 41 and height 81.
; PLAN: r0=437(x), r1=77(y), r2=41(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 77
LDI r2, 41
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
