; DESCRIPTION: Draws a orange rectangle at (253, 2) with width 20 and height 97.
; PLAN: r0=253(x), r1=2(y), r2=20(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 2
LDI r2, 20
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
