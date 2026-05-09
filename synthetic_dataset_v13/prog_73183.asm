; DESCRIPTION: Draws a orange rectangle at (249, 49) with width 26 and height 80.
; PLAN: r0=249(x), r1=49(y), r2=26(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 49
LDI r2, 26
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
