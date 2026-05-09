; DESCRIPTION: Draws a orange rectangle at (0, 6) with width 35 and height 46.
; PLAN: r0=0(x), r1=6(y), r2=35(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 6
LDI r2, 35
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
