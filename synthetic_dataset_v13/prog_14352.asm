; DESCRIPTION: Draws a orange rectangle at (100, 98) with width 119 and height 86.
; PLAN: r0=100(x), r1=98(y), r2=119(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 98
LDI r2, 119
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
