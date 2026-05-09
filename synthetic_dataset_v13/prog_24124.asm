; DESCRIPTION: Draws a orange rectangle at (4, 87) with width 99 and height 18.
; PLAN: r0=4(x), r1=87(y), r2=99(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 87
LDI r2, 99
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
