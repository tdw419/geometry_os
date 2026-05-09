; DESCRIPTION: Draws a purple rectangle at (277, 95) with width 114 and height 31.
; PLAN: r0=277(x), r1=95(y), r2=114(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 95
LDI r2, 114
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
