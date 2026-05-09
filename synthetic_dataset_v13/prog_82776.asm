; DESCRIPTION: Draws a orange rectangle at (311, 91) with width 86 and height 29.
; PLAN: r0=311(x), r1=91(y), r2=86(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 91
LDI r2, 86
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
