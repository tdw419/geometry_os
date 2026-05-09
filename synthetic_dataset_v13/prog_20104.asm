; DESCRIPTION: Draws a orange rectangle at (399, 160) with width 44 and height 54.
; PLAN: r0=399(x), r1=160(y), r2=44(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 160
LDI r2, 44
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
