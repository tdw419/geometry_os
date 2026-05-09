; DESCRIPTION: Draws a orange rectangle at (166, 165) with width 97 and height 79.
; PLAN: r0=166(x), r1=165(y), r2=97(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 165
LDI r2, 97
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
