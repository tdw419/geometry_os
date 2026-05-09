; DESCRIPTION: Draws a orange rectangle at (241, 71) with width 17 and height 11.
; PLAN: r0=241(x), r1=71(y), r2=17(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 71
LDI r2, 17
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
