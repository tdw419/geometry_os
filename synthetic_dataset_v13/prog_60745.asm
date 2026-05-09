; DESCRIPTION: Draws a orange rectangle at (290, 195) with width 26 and height 23.
; PLAN: r0=290(x), r1=195(y), r2=26(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 195
LDI r2, 26
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
