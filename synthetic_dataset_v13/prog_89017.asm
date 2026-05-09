; DESCRIPTION: Draws a orange rectangle at (290, 78) with width 98 and height 115.
; PLAN: r0=290(x), r1=78(y), r2=98(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 78
LDI r2, 98
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
