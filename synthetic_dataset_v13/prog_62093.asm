; DESCRIPTION: Draws a orange rectangle at (300, 55) with width 15 and height 75.
; PLAN: r0=300(x), r1=55(y), r2=15(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 55
LDI r2, 15
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
