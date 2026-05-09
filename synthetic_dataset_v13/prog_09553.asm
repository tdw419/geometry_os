; DESCRIPTION: Draws a orange rectangle at (148, 153) with width 75 and height 66.
; PLAN: r0=148(x), r1=153(y), r2=75(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 153
LDI r2, 75
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
