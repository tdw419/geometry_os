; DESCRIPTION: Draws a purple rectangle at (312, 58) with width 49 and height 71.
; PLAN: r0=312(x), r1=58(y), r2=49(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 58
LDI r2, 49
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
