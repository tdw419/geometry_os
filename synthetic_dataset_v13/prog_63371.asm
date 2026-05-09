; DESCRIPTION: Draws a yellow rectangle at (201, 92) with width 112 and height 95.
; PLAN: r0=201(x), r1=92(y), r2=112(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 92
LDI r2, 112
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
