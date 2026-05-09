; DESCRIPTION: Draws a yellow rectangle at (85, 7) with width 75 and height 118.
; PLAN: r0=85(x), r1=7(y), r2=75(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 7
LDI r2, 75
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
