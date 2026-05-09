; DESCRIPTION: Draws a orange rectangle at (247, 72) with width 23 and height 105.
; PLAN: r0=247(x), r1=72(y), r2=23(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 72
LDI r2, 23
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
