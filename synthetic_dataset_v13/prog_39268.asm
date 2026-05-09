; DESCRIPTION: Draws a orange rectangle at (267, 114) with width 28 and height 105.
; PLAN: r0=267(x), r1=114(y), r2=28(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 114
LDI r2, 28
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
