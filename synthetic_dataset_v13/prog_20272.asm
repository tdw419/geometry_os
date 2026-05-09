; DESCRIPTION: Draws a yellow rectangle at (334, 4) with width 73 and height 112.
; PLAN: r0=334(x), r1=4(y), r2=73(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 4
LDI r2, 73
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
