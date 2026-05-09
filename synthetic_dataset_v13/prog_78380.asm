; DESCRIPTION: Draws a orange rectangle at (399, 33) with width 81 and height 10.
; PLAN: r0=399(x), r1=33(y), r2=81(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 33
LDI r2, 81
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
