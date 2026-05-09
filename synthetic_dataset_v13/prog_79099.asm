; DESCRIPTION: Draws a orange rectangle at (364, 161) with width 46 and height 89.
; PLAN: r0=364(x), r1=161(y), r2=46(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 161
LDI r2, 46
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
