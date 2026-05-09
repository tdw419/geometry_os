; DESCRIPTION: Draws a orange rectangle at (151, 65) with width 98 and height 23.
; PLAN: r0=151(x), r1=65(y), r2=98(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 65
LDI r2, 98
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
