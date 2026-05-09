; DESCRIPTION: Draws a purple rectangle at (405, 175) with width 100 and height 77.
; PLAN: r0=405(x), r1=175(y), r2=100(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 175
LDI r2, 100
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
