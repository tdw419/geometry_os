; DESCRIPTION: Draws a purple rectangle at (425, 102) with width 79 and height 36.
; PLAN: r0=425(x), r1=102(y), r2=79(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 102
LDI r2, 79
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
