; DESCRIPTION: Draws a orange rectangle at (119, 109) with width 25 and height 10.
; PLAN: r0=119(x), r1=109(y), r2=25(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 109
LDI r2, 25
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
