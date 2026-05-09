; DESCRIPTION: Draws a orange rectangle at (11, 44) with width 40 and height 25.
; PLAN: r0=11(x), r1=44(y), r2=40(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 44
LDI r2, 40
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
