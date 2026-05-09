; DESCRIPTION: Draws a orange rectangle at (105, 36) with width 107 and height 91.
; PLAN: r0=105(x), r1=36(y), r2=107(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 36
LDI r2, 107
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
