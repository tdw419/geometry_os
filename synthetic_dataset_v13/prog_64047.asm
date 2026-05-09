; DESCRIPTION: Draws a orange rectangle at (112, 127) with width 35 and height 107.
; PLAN: r0=112(x), r1=127(y), r2=35(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 127
LDI r2, 35
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
