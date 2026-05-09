; DESCRIPTION: Draws a orange rectangle at (229, 216) with width 73 and height 25.
; PLAN: r0=229(x), r1=216(y), r2=73(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 216
LDI r2, 73
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
