; DESCRIPTION: Draws a orange rectangle at (310, 142) with width 107 and height 114.
; PLAN: r0=310(x), r1=142(y), r2=107(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 142
LDI r2, 107
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
