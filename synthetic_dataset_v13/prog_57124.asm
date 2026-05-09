; DESCRIPTION: Draws a orange rectangle at (366, 10) with width 112 and height 118.
; PLAN: r0=366(x), r1=10(y), r2=112(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 10
LDI r2, 112
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
