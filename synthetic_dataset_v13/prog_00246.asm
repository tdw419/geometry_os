; DESCRIPTION: Draws a orange rectangle at (15, 197) with width 112 and height 43.
; PLAN: r0=15(x), r1=197(y), r2=112(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 197
LDI r2, 112
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
