; DESCRIPTION: Draws a purple rectangle at (312, 223) with width 92 and height 29.
; PLAN: r0=312(x), r1=223(y), r2=92(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 223
LDI r2, 92
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
