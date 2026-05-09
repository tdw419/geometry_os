; DESCRIPTION: Draws a orange rectangle at (148, 31) with width 90 and height 102.
; PLAN: r0=148(x), r1=31(y), r2=90(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 31
LDI r2, 90
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
