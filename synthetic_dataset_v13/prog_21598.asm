; DESCRIPTION: Draws a orange rectangle at (252, 102) with width 23 and height 102.
; PLAN: r0=252(x), r1=102(y), r2=23(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 102
LDI r2, 23
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
