; DESCRIPTION: Draws a orange rectangle at (272, 227) with width 100 and height 21.
; PLAN: r0=272(x), r1=227(y), r2=100(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 227
LDI r2, 100
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
