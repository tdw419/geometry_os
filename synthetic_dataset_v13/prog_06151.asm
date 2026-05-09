; DESCRIPTION: Draws a red rectangle at (162, 10) with width 44 and height 105.
; PLAN: r0=162(x), r1=10(y), r2=44(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 10
LDI r2, 44
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
