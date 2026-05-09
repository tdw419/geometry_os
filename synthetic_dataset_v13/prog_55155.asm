; DESCRIPTION: Draws a purple rectangle at (259, 172) with width 44 and height 35.
; PLAN: r0=259(x), r1=172(y), r2=44(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 172
LDI r2, 44
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
