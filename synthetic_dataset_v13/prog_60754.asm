; DESCRIPTION: Draws a orange rectangle at (334, 90) with width 90 and height 102.
; PLAN: r0=334(x), r1=90(y), r2=90(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 90
LDI r2, 90
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
