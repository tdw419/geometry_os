; DESCRIPTION: Draws a orange rectangle at (223, 216) with width 36 and height 35.
; PLAN: r0=223(x), r1=216(y), r2=36(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 216
LDI r2, 36
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
