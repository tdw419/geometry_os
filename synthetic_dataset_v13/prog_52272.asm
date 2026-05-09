; DESCRIPTION: Draws a orange rectangle at (319, 18) with width 43 and height 39.
; PLAN: r0=319(x), r1=18(y), r2=43(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 18
LDI r2, 43
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
