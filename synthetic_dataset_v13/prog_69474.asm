; DESCRIPTION: Draws a orange rectangle at (102, 44) with width 75 and height 36.
; PLAN: r0=102(x), r1=44(y), r2=75(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 44
LDI r2, 75
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
