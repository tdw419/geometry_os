; DESCRIPTION: Draws a orange rectangle at (182, 2) with width 46 and height 107.
; PLAN: r0=182(x), r1=2(y), r2=46(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 2
LDI r2, 46
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
