; DESCRIPTION: Draws a orange rectangle at (89, 207) with width 98 and height 17.
; PLAN: r0=89(x), r1=207(y), r2=98(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 207
LDI r2, 98
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
