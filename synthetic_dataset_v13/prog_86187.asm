; DESCRIPTION: Draws a orange rectangle at (160, 16) with width 119 and height 75.
; PLAN: r0=160(x), r1=16(y), r2=119(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 16
LDI r2, 119
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
