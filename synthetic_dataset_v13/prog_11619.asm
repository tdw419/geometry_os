; DESCRIPTION: Draws a orange rectangle at (111, 138) with width 19 and height 107.
; PLAN: r0=111(x), r1=138(y), r2=19(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 138
LDI r2, 19
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
