; DESCRIPTION: Draws a orange rectangle at (195, 165) with width 80 and height 62.
; PLAN: r0=195(x), r1=165(y), r2=80(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 165
LDI r2, 80
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
