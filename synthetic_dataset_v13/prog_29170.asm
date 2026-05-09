; DESCRIPTION: Draws a purple rectangle at (291, 97) with width 102 and height 16.
; PLAN: r0=291(x), r1=97(y), r2=102(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 97
LDI r2, 102
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
