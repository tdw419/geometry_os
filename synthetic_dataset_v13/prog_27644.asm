; DESCRIPTION: Draws a orange rectangle at (85, 174) with width 65 and height 72.
; PLAN: r0=85(x), r1=174(y), r2=65(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 174
LDI r2, 65
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
