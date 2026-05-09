; DESCRIPTION: Draws a green rectangle at (312, 182) with width 100 and height 52.
; PLAN: r0=312(x), r1=182(y), r2=100(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 182
LDI r2, 100
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
