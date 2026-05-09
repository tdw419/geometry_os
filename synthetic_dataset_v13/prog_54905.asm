; DESCRIPTION: Draws a orange rectangle at (190, 172) with width 84 and height 18.
; PLAN: r0=190(x), r1=172(y), r2=84(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 172
LDI r2, 84
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
