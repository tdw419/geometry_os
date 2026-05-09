; DESCRIPTION: Draws a orange rectangle at (183, 71) with width 65 and height 37.
; PLAN: r0=183(x), r1=71(y), r2=65(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 71
LDI r2, 65
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
