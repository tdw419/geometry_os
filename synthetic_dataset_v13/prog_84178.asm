; DESCRIPTION: Draws a orange rectangle at (44, 17) with width 91 and height 25.
; PLAN: r0=44(x), r1=17(y), r2=91(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 17
LDI r2, 91
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
