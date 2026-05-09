; DESCRIPTION: Draws a orange rectangle at (90, 201) with width 23 and height 21.
; PLAN: r0=90(x), r1=201(y), r2=23(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 201
LDI r2, 23
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
