; DESCRIPTION: Draws a orange rectangle at (127, 10) with width 77 and height 65.
; PLAN: r0=127(x), r1=10(y), r2=77(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 10
LDI r2, 77
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
