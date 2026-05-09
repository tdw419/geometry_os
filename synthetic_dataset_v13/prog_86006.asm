; DESCRIPTION: Draws a yellow rectangle at (47, 161) with width 31 and height 85.
; PLAN: r0=47(x), r1=161(y), r2=31(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 161
LDI r2, 31
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
