; DESCRIPTION: Draws a orange rectangle at (273, 189) with width 107 and height 26.
; PLAN: r0=273(x), r1=189(y), r2=107(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 189
LDI r2, 107
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
