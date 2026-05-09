; DESCRIPTION: Draws a orange rectangle at (18, 174) with width 52 and height 25.
; PLAN: r0=18(x), r1=174(y), r2=52(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 174
LDI r2, 52
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
