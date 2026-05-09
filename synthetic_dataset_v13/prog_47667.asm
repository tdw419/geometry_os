; DESCRIPTION: Draws a orange rectangle at (212, 72) with width 74 and height 105.
; PLAN: r0=212(x), r1=72(y), r2=74(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 72
LDI r2, 74
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
