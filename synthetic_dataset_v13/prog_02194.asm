; DESCRIPTION: Draws a orange rectangle at (155, 161) with width 46 and height 50.
; PLAN: r0=155(x), r1=161(y), r2=46(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 161
LDI r2, 46
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
