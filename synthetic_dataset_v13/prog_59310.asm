; DESCRIPTION: Draws a orange rectangle at (73, 167) with width 117 and height 84.
; PLAN: r0=73(x), r1=167(y), r2=117(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 167
LDI r2, 117
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
