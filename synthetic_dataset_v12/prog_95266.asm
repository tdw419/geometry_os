; DESCRIPTION: Draws a yellow rectangle at (332, 109) with width 110 and height 61.
; PLAN: r0=332(x), r1=109(y), r2=110(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 109
LDI r2, 110
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
