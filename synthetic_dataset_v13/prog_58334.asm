; DESCRIPTION: Draws a orange rectangle at (112, 194) with width 88 and height 25.
; PLAN: r0=112(x), r1=194(y), r2=88(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 194
LDI r2, 88
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
