; DESCRIPTION: Draws a orange rectangle at (169, 85) with width 106 and height 71.
; PLAN: r0=169(x), r1=85(y), r2=106(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 85
LDI r2, 106
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
