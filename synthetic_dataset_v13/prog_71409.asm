; DESCRIPTION: Draws a orange rectangle at (378, 165) with width 112 and height 71.
; PLAN: r0=378(x), r1=165(y), r2=112(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 165
LDI r2, 112
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
