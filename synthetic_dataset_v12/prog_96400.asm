; DESCRIPTION: Draws a orange rectangle at (208, 200) with width 81 and height 13.
; PLAN: r0=208(x), r1=200(y), r2=81(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 200
LDI r2, 81
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
