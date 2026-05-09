; DESCRIPTION: Draws a orange rectangle at (127, 106) with width 87 and height 108.
; PLAN: r0=127(x), r1=106(y), r2=87(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 106
LDI r2, 87
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
