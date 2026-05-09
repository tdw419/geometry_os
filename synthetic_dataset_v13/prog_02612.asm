; DESCRIPTION: Draws a orange rectangle at (335, 75) with width 40 and height 119.
; PLAN: r0=335(x), r1=75(y), r2=40(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 75
LDI r2, 40
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
