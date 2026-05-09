; DESCRIPTION: Draws a orange rectangle at (426, 134) with width 33 and height 95.
; PLAN: r0=426(x), r1=134(y), r2=33(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 134
LDI r2, 33
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
