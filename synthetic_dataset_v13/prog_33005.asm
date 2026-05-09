; DESCRIPTION: Draws a orange rectangle at (75, 153) with width 108 and height 52.
; PLAN: r0=75(x), r1=153(y), r2=108(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 153
LDI r2, 108
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
