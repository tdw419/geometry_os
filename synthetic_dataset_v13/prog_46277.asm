; DESCRIPTION: Draws a orange rectangle at (19, 187) with width 26 and height 49.
; PLAN: r0=19(x), r1=187(y), r2=26(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 187
LDI r2, 26
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
