; DESCRIPTION: Draws a orange rectangle at (17, 30) with width 75 and height 118.
; PLAN: r0=17(x), r1=30(y), r2=75(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 30
LDI r2, 75
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
