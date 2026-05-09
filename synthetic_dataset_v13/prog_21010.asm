; DESCRIPTION: Draws a purple rectangle at (329, 166) with width 36 and height 33.
; PLAN: r0=329(x), r1=166(y), r2=36(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 166
LDI r2, 36
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
