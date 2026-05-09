; DESCRIPTION: Draws a purple rectangle at (352, 9) with width 107 and height 73.
; PLAN: r0=352(x), r1=9(y), r2=107(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 9
LDI r2, 107
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
