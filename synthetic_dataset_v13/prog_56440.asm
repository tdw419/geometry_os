; DESCRIPTION: Draws a purple rectangle at (269, 153) with width 19 and height 102.
; PLAN: r0=269(x), r1=153(y), r2=19(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 153
LDI r2, 19
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
