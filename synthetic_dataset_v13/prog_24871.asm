; DESCRIPTION: Draws a orange rectangle at (258, 3) with width 80 and height 87.
; PLAN: r0=258(x), r1=3(y), r2=80(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 3
LDI r2, 80
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
