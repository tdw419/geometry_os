; DESCRIPTION: Draws a orange rectangle at (414, 105) with width 47 and height 39.
; PLAN: r0=414(x), r1=105(y), r2=47(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 105
LDI r2, 47
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
