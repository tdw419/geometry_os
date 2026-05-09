; DESCRIPTION: Draws a orange rectangle at (361, 87) with width 91 and height 99.
; PLAN: r0=361(x), r1=87(y), r2=91(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 87
LDI r2, 91
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
