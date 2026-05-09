; DESCRIPTION: Draws a orange rectangle at (425, 153) with width 22 and height 100.
; PLAN: r0=425(x), r1=153(y), r2=22(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 153
LDI r2, 22
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
