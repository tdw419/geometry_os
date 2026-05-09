; DESCRIPTION: Draws a yellow rectangle at (316, 145) with width 87 and height 95.
; PLAN: r0=316(x), r1=145(y), r2=87(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 145
LDI r2, 87
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
