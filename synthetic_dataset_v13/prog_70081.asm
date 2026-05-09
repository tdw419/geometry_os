; DESCRIPTION: Draws a black rectangle at (266, 112) with width 36 and height 87.
; PLAN: r0=266(x), r1=112(y), r2=36(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 112
LDI r2, 36
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
