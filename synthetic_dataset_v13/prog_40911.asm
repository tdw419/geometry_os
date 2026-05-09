; DESCRIPTION: Draws a orange rectangle at (201, 206) with width 80 and height 41.
; PLAN: r0=201(x), r1=206(y), r2=80(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 206
LDI r2, 80
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
