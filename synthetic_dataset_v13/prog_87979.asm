; DESCRIPTION: Draws a purple rectangle at (343, 146) with width 40 and height 77.
; PLAN: r0=343(x), r1=146(y), r2=40(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 146
LDI r2, 40
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
