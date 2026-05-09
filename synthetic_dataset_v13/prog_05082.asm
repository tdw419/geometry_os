; DESCRIPTION: Draws a orange rectangle at (105, 132) with width 97 and height 13.
; PLAN: r0=105(x), r1=132(y), r2=97(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 132
LDI r2, 97
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
